class Ui_Filter < Qt::MainWindow
  slots  "reset_or_ok(QAbstractButton*)", "widget_option_db()"

  def initialize(this = $app, parent = nil)
    super(parent)
    @this = this
    @ui = Ui_MainWindow.new
    @ui.setupUi(self)
    
    connect(@ui.chk_lastName, SIGNAL("stateChanged(int)"), SLOT("edit_lastName_change(int)"))
    connect(@ui.chk_firstName, SIGNAL("stateChanged(int)"), SLOT("edit_firstName_change(int)"))
    connect(@ui.chk_patrName, SIGNAL("stateChanged(int)"), SLOT("edit_patrName_change(int)"))
    connect(@ui.chk_birthDate, SIGNAL("stateChanged(int)"), SLOT("edit_birthDate_change(int)"))
    connect(@ui.chk_sex, SIGNAL("stateChanged(int)"), SLOT("edit_sex_change(int)"))
    connect(@ui.chk_SNILS, SIGNAL("stateChanged(int)"), SLOT("edit_SNILS_change(int)"))
    connect(@ui.chk_document, SIGNAL("stateChanged(int)"), SLOT("edit_document_change(int)"))
    connect(@ui.chk_policy, SIGNAL("stateChanged(int)"), SLOT("edit_policy_change(int)"))
    connect(@ui.chk_policyActual, SIGNAL("stateChanged(int)"), SLOT("edit_policyActual_change(int)"))
    connect(@ui.chk_adress, SIGNAL("stateChanged(int)"), SLOT("edit_adress_change(int)"))
    connect(@ui.chk_adressPlace, SIGNAL("stateChanged(int)"), SLOT("edit_adressPlace_change(int)"))
    connect(@ui.reset_or_ok, SIGNAL("clicked(QAbstractButton*)"), SLOT("reset_or_ok(QAbstractButton*)"))
    connect(@ui.options_db, SIGNAL("triggered(bool)"), SLOT("widget_option_db()"))
    @count_all_record = Qt::Label.new
    @ui.statusbar.addPermanentWidget(@count_all_record)
    
    @ui.edit_policyActual.setDate(Qt::Date.new.currentDate)
    
    
   
    
  end
  
  def ui_fill_adressPlace
    @ui.edit_adressPlace.addItem("")
    @this.kladr.socrbase([1], ["SOCRNAME", "SCNAME"]).each do |val|
      @ui.edit_adressPlace.addItem(val["SOCRNAME"], Qt::Variant.new(val["SCNAME"]))
    end  
  end
  
  def ui_fill_policyKind
    @ui.eidt_policyKind.addItem("")
    @this.db.rbPolicyKind(["name", "id"]).each do |val|
      @ui.eidt_policyKind.addItem(val["name"], Qt::Variant.new(val["id"]))
    end  
  end
  
  def ui_fill_policyType
    @ui.eidt_policyType.addItem("")
    @this.db.rbPolicyType(["name", "id"]).each do |val|
      @ui.eidt_policyType.addItem(val["name"], Qt::Variant.new(val["id"]))
    end  
  end
  
  def ui_fill_documentType
    @ui.edit_documentType.addItem("")
    @this.db.rbDocumentType(1, ["name", "id"]).each do |val|
      @ui.edit_documentType.addItem(val["name"].capitalize, Qt::Variant.new(val["id"]))
    end
  end
  
  def widget_option_db
    ui_Option_db = Ui_Option_db_act.new
    emit "settings_update" if ui_Option_db.exec == 1
    ui_Option_db.dispose
  end
  
  def parse_where(input)
    input.keys.map{ |key| "(#{key} #{input[key][1]} '#{input[key].first}')"}.join(" and ").force_encoding("UTF-8")
  end
  
  def parse_from(arr)
    arr.map{|v| "#{v[:type]} #{v[:table1_name]} ON `#{v[:table1_name]}`.#{v[:table1_column]} = `#{v[:table2_name]}`.#{v[:table2_column]}"}.join(" ")
  end
  
  def filter_apply
    timeStartRb = Time.new
    
    where, from = filter_parse
    #return 0 if where.size.zero?
    w = parse_where(where)
    limit = 1_000
    f = parse_from(from)
    query = "SELECT SQL_CALC_FOUND_ROWS lastName, firstName, patrName, birthDate, sex FROM Client #{f} #{w.empty? ? "" : "WHERE #{w}"} GROUP BY `Client`.id LIMIT #{limit}"
    p query
    results = @this.db.query(query)
    count = @this.db.query("SELECT FOUND_ROWS();").first["FOUND_ROWS()"] #может быть не точным
    p count
    #@count_all_record.text = "Общее количество найденых записей: #{count} (отображено: #{(count <= limit ? count : limit)})"
    @count_all_record.text = "Отображение строк 0 - #{(count <= limit ? count : limit)} (#{count} всего, Запрос занял #{Time.new - timeStartRb} сек.)"
    p "Выполнен запрос mysql2: #{Time.new - timeStartRb} sec"
    
    @ui.tableView.model.dispose if @ui.tableView.model
    model = Qt::StandardItemModel.new(@ui.tableView)
    @ui.tableView.setModel(model)
    
    results.each_with_index do |row, i|
      row.each_with_index do |col, j|
        newItem = Qt::StandardItem.new(col.last.to_s)
        model.setItem(i, j, newItem)
      end
    end
    
    model.setHeaderData(4, Qt::Horizontal, Qt::Variant.new("fdsafds"))
    @ui.tableView.columnWidth(100)
    
    p "Выполнен запрос и отображена таблица mysql2: #{Time.new - timeStartRb} sec"

    
  end
  
  def filter_parse
    filter = {}
    from = []
    #filter[fieldName] = [value, type]
    if @ui.chk_lastName.checked? and (lastName = @ui.edit_lastName.text.strip.trim).any?
      filter["`Client`.lastName"] = ["%#{lastName}%", "LIKE"]
    end
    
    if @ui.chk_firstName.checked? and (firstName = @ui.edit_firstName.text.strip.trim).any?
      filter["`Client`.firstName"] = ["%#{firstName}%", "LIKE"]
    end
    
    if @ui.chk_patrName.checked? and (patrName = @ui.edit_patrName.text.strip.trim).any?
      filter["`Client`.patrName"] = ["%#{patrName}%", "LIKE"]
    end
    
    if @ui.chk_birthDate.checked?
      d = @ui.edit_birthDate.date
      filter["`Client`.birthDate"] = ["#{d.year}-#{d.month}-#{d.day}", "="]
    end
    
    if @ui.chk_sex.checked?
      filter["`Client`.sex"] = [(@ui.edit_sex.currentIndex).to_s, "="]
    end
    
    if @ui.chk_SNILS.checked? and (snils = @ui.edit_SNILS.text.strip.trim).any?
      filter["`Client`.SNILS"] = [snils, "="]
    end
    
    if @ui.chk_document.checked?
      filter["`ClientDocument`.documentType_id"] = [@ui.edit_documentType.itemData(@ui.edit_documentType.currentIndex).toInt.to_s, "="] if @ui.edit_documentType.currentIndex != 0
      if (serial = @ui.edit_documentSerial.text.strip.trim).any?; filter["`ClientDocument`.serial"] = [serial, "="]; end 
      if (number = @ui.edit_documentNumber.text.strip.trim).any?; filter["`ClientDocument`.number"] = [number, "="]; end
      if filter.keys.grep(/^`ClientDocument/).any?
        from << {
          :type => "INNER JOIN", 
          :table1_name => "ClientDocument", 
          :table1_column => "client_id", 
          :table2_name => "Client", 
          :table2_column => "id"
        }
      end
    end
    
    if @ui.chk_policy.checked?
      filter["`ClientPolicy`.policyType_id"] = [@ui.eidt_policyType.itemData(@ui.eidt_policyType.currentIndex).toInt.to_s, "="] if @ui.eidt_policyType.currentIndex != 0
      filter["`ClientPolicy`.policyKind_id"] = [@ui.eidt_policyKind.itemData(@ui.eidt_policyKind.currentIndex).toInt.to_s, "="] if @ui.eidt_policyKind.currentIndex != 0
      if (serial = @ui.edit_policySerial.text.strip.trim).any?; filter["`ClientPolicy`.serial"] = [serial, "="]; end 
      if (number = @ui.edit_policyNumber.text.strip.trim).any?; filter["`ClientPolicy`.number"] = [number, "="]; end
      if @ui.chk_policyActual.checked?
        d = @ui.edit_policyActual.date
        d = "#{d.year}-#{d.month}-#{d.day}"
        filter["`ClientPolicy`.begDate"] = [d, "<"]
        filter["`ClientPolicy`.endDate"] = [d, ">"] #fixme нужно проверить...
      end
      if filter.keys.grep(/^`ClientPolicy/).any?
        from << {
          :type => "INNER JOIN", 
          :table1_name => "ClientPolicy", 
          :table1_column => "client_id", 
          :table2_name => "Client", 
          :table2_column => "id"
        }
      end
    end
    
    if @ui.chk_adress.checked?
      if @ui.chk_adressPlace.checked?
        x = @ui.edit_adressPlace.itemData(@ui.edit_adressPlace.currentIndex).toString.force_encoding("UTF-8")
        filter["`kladr`.`KLADR`.SOCR"] = [x, (@ui.chk_adressPlaceNot.checked? ? "!=" : "=")]
      end
      
      
    end

    return [filter, from]
  end
  
  def filter_clear
    @ui.chk_lastName.setChecked(false)
    @ui.chk_firstName.setChecked(false)
    @ui.chk_patrName.setChecked(false)
    @ui.chk_birthDate.setChecked(false)
    @ui.chk_sex.setChecked(false)
    @ui.chk_SNILS.setChecked(false)
    @ui.chk_document.setChecked(false)
    @ui.chk_policy.setChecked(false)
  end
  
  def reset_or_ok(n)
    case @ui.reset_or_ok::standardButton(n)
      when Qt::DialogButtonBox::Ok
        #применяем фильтр
        filter_apply
      when Qt::DialogButtonBox::Reset
        #очищаем фильтр
        filter_clear
    end
  end
  
slots "edit_lastName_change(int)", 
  "edit_firstName_change(int)", 
  "edit_patrName_change(int)", 
  "edit_birthDate_change(int)",
  "edit_sex_change(int)",
  "edit_SNILS_change(int)",
  "edit_document_change(int)",
  "edit_policy_change(int)",
  "edit_policyActual_change(int)",
  "edit_adress_change(int)",
  "edit_adressPlace_change(int)"
    
  def edit_lastName_change(n)
    @ui.edit_lastName.enabled = n 
  end
  
  def edit_firstName_change(n)
    @ui.edit_firstName.enabled = n 
  end
  
  def edit_patrName_change(n)
    @ui.edit_patrName.enabled = n 
  end
  
  def edit_birthDate_change(n)
    @ui.edit_birthDate.enabled = n 
  end
  
  def edit_sex_change(n)
    @ui.edit_sex.enabled = n 
  end
  
  def edit_SNILS_change(n)
    @ui.edit_SNILS.enabled = n 
  end
  
  def edit_document_change(n)
    ui_fill_documentType if @ui.edit_documentType.count.zero?
    @ui.edit_documentType.enabled = n
    @ui.edit_documentSerial.enabled = n
    @ui.edit_documentNumber.enabled = n
  end
  
  def edit_policy_change(n)
    ui_fill_policyType if @ui.eidt_policyType.count.zero?
    ui_fill_policyKind if @ui.eidt_policyKind.count.zero?
    @ui.eidt_policyType.enabled = n
    @ui.edit_policySerial.enabled = n
    @ui.edit_policyNumber.enabled = n
    @ui.eidt_policyKind.enabled = n
    @ui.chk_policyActual.enabled = n
    edit_policyActual_change(n) if n == 0 or @ui.chk_policyActual.checked? #осторожно...
  end
  
  def edit_policyActual_change(n)
    @ui.edit_policyActual.enabled = n
  end
  
  def edit_adress_change(n)
    @ui.edit_adressType.enabled = n
    @ui.chk_adressPlace.enabled = n
    edit_adressPlace_change(n) if n == 0 or @ui.chk_adressPlace.checked?
  end
  
  def edit_adressPlace_change(n)
    ui_fill_adressPlace if @ui.edit_adressPlace.count.zero?
    @ui.edit_adressPlace.enabled = n
    @ui.chk_adressPlaceNot.enabled = n
  end
  
end