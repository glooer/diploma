class Ui_Option_db_act < Qt::Dialog
    slots "cancel_or_ok(QAbstractButton*)"
  
  def initialize(this = $app, parent = nil)
    super(parent)
    @ui = Ui_Settings_db.new
    @ui.setupUi(self)
    @block = "test"
    @this = this
    load_settings
    connect(@ui.buttonBox, SIGNAL("clicked(QAbstractButton*)"), SLOT("cancel_or_ok(QAbstractButton*)"))
  end
  
  def load_settings
    @ui.edit_host_name.text = @this.settings["#{@block}/host"]
    @ui.edit_port.value = @this.settings["#{@block}/port"]
    @ui.edit_db_name.text = @this.settings["#{@block}/database"]
    @ui.edit_user_name.text = @this.settings["#{@block}/username"]
    @ui.edit_user_password.text = @this.settings["#{@block}/password"]
  end
  
  def setup_settings
    @this.settings["#{@block}/host"] = @ui.edit_host_name.text
    @this.settings["#{@block}/port"] = @ui.edit_port.value
    @this.settings["#{@block}/database"] = @ui.edit_db_name.text
    @this.settings["#{@block}/username"] = @ui.edit_user_name.text
    @this.settings["#{@block}/password"] = @ui.edit_user_password.text
  end
  
  def cancel_or_ok(n)
    case @ui.buttonBox::standardButton(n)
      when Qt::DialogButtonBox::Ok
        setup_settings
      #when Qt::DialogButtonBox::Cancel
      #  close
    end
    close
  end
  
end 