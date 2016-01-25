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
    connect(@ui.reset_or_ok, SIGNAL("clicked(QAbstractButton*)"), SLOT("reset_or_ok(QAbstractButton*)"))
    connect(@ui.options_db, SIGNAL("triggered(bool)"), SLOT("widget_option_db()"))
    @count_all_record = Qt::Label.new
    @ui.statusbar.addPermanentWidget(@count_all_record)
    
    ui_fill_documentType
    ui_fill_policyType
    
  end
  
  def ui_fill_policyType
    @this.db.rbPolicyType(["name", "id"]).each do |val|
      @ui.eidt_policyType.addItem(val["name"], Qt::Variant.new(val["id"]))
    end  
  end
  
  def ui_fill_documentType
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
    return input.keys.map{ |key| 
      "(#{key} #{input[key][1]} '#{input[key].first}')"
    }.join(" and ").force_encoding("UTF-8")
  end
  
  def parse_from(arr)
    from = []
    arr.each do |v|
      from << "#{v[:type]} #{v[:table1_name]} ON `#{v[:table1_name]}`.#{v[:table1_column]} = `#{v[:table2_name]}`.#{v[:table2_column]}"
    end
    from.join(" ")
  end
  
  def filter_apply
    timeStartRb = Time.new
    
    where, from = filter_parse
    if where.size.zero?
      return
    end
    w = parse_where(where)
    limit = 1000
    f = parse_from(from)
    #from.map!{|v| "#{v.last} `#{v[0]}` ON `#{v[1]}` = `#{v[3]}`"}
    query = "SELECT SQL_CALC_FOUND_ROWS lastName, firstName, patrName, birthDate, sex FROM Client #{f}  WHERE #{w} GROUP BY `Client`.id LIMIT #{limit}"
    p query
    results = @this.db.query(query)
    count = @this.db.query("SELECT FOUND_ROWS();").first["FOUND_ROWS()"] #может быть не точным
    p count
    #@count_all_record.text = "Общее количество найденых записей: #{count} (отображено: #{(count <= limit ? count : limit)})"
    @count_all_record.text = "Отображение строк 0 - #{(count <= limit ? count : limit)} (#{count} всего, Запрос занял #{Time.new - timeStartRb} сек.)"
    p "Выполнен запрос mysql2: #{Time.new - timeStartRb} sec"
    
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
    '''
    for row in (0...100)
      for column in (0...2)
        newItem = Qt::StandardItem.new("row = #{row}; col = #{column}")
        model.setItem(row, column, newItem)
      end
    end
    
    model.removeRows(0, model.rowCount)
    model.removeColumns(0, model.columnCount)
    
    '''
    #p where
    #p from
    
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
      filter["`Client`.sex"] = [(@ui.edit_sex.currentIndex + 1).to_s, "="]
    end
    
    if @ui.chk_SNILS.checked? and (snils = @ui.edit_SNILS.text.strip.trim).any?
      filter["`Client`.SNILS"] = [snils, "="]
    end
    
    if @ui.chk_document.checked?
      from << {
        :type => "INNER JOIN", 
        :table1_name => "ClientDocument", 
        :table1_column => "client_id", 
        :table2_name => "Client", 
        :table2_column => "id"
      }
      filter["`ClientDocument`.documentType_id"] = [@ui.edit_documentType.itemData(@ui.edit_documentType.currentIndex).toInt.to_s, "="]
      if (serial = @ui.edit_documentSerial.text.strip.trim).any?; filter["`ClientDocument`.serial"] = [serial, "="]; end 
      if (number = @ui.edit_documentNumber.text.strip.trim).any?; filter["`ClientDocument`.number"] = [number, "="]; end
    end
    
    if @ui.chk_policy.checked?
      from << {
        :type => "INNER JOIN", 
        :table1_name => "ClientPolicy", 
        :table1_column => "client_id", 
        :table2_name => "Client", 
        :table2_column => "id"      
      }
      
    
    end
    
        #@ui.edit_documentType.addItem("123 m", Qt::Variant.new(1243))
    #p @ui.edit_documentType.itemData(2).toInt
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
  "edit_policy_change(int)"
    
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
    @ui.edit_documentType.enabled = n
    @ui.edit_documentSerial.enabled = n
    @ui.edit_documentNumber.enabled = n
  end
  
  def edit_policy_change(n)
    @ui.eidt_policyType.enabled = n
  end
  
end