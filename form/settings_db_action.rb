# coding: utf-8

$:.unshift(File.dirname(__FILE__))

require "Qt4"
require "settings_db.rb"

class Ui_Option_db_act < Qt::Widget
    slots "cancel_or_ok(QAbstractButton*)"
  
  
  def initialize(parent = nil)
    super

    @ui = Ui_Option_db.new
    @ui.setupUi(self)
    @settings = Qt::Settings.new("set.ini", Qt::Settings::IniFormat)
    load_settings
    
    connect(@ui.buttonBox, SIGNAL("clicked(QAbstractButton*)"), SLOT("cancel_or_ok(QAbstractButton*)"))
  end
  
  def load_settings
    @settings.beginGroup("test");
    @ui.edit_host_name.text = @settings.value("hostName", Qt::Variant.new("")).value
    @ui.edit_user_name.text = @settings.value("userName", Qt::Variant.new("")).value
    @ui.edit_user_password.text = @settings.value("userPassword", Qt::Variant.new("")).value #fixme не ок так хранить пароль
    @settings.endGroup();
  end
  
  def setup_settings
    @settings.beginGroup("test");
    @settings.setValue("hostName", Qt::Variant.new(@ui.edit_host_name.text))
    @settings.setValue("userName", Qt::Variant.new(@ui.edit_user_name.text))
    @settings.setValue("userPassword", Qt::Variant.new(@ui.edit_user_password.text))
    @settings.endGroup();
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