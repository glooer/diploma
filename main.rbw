# coding: utf-8
#chcp 65001
appTimeStart = Time.new

$:.unshift(File.dirname(__FILE__))

require "unicode"
require "module/advancedQtClasses.rb"
require "module/advancedStandartClasses.rb"
require "Qt4"
require "module/require_all_ui.rb"
require "form/Main_form.rb"
require "module/Settings.rb"
require "module/DB.rb"
require "module/kladr.rb"
require "form/settings_db.rb"

class Application < Qt::Application
  attr_reader :settings, :db, :kladr

  def initialize
    super(ARGV)
    @settings = MSettings.new("set.ini", Qt::Settings::IniFormat)
    
    begin
      block = "test"
      @db = Mysql2::Client.new(:host => @settings["#{block}/host"], :username => @settings["#{block}/username"], :password => @settings["#{block}/password"], :database => @settings["#{block}/database"], :port => @settings["#{block}/port"])
    rescue Mysql2::Error
      p "Ошибка: #{$!.inspect}"
      Qt::MessageBox.new{
        self.text = "#{$!}\n Проверь настройки!"
        self.icon = Qt::MessageBox::Information
      }.exec()
      ui_Option_db = Ui_Option_db_act.new(self)
      if ui_Option_db.exec == 1 
        retry
      else
        exit
      end
      ui_Option_db.dispose
      #сказать какая ошибка, и выкинуть окно настроек.
      #
      #если в окне настроек нажата отмена - завершиться
      #
    end
    
    begin
      db_kladr_name = "kladr"
      @kladr = Kladr.new(:host => @settings["#{block}/host"], :username => @settings["#{block}/username"], :password => @settings["#{block}/password"], :database => db_kladr_name, :port => @settings["#{block}/port"])
    rescue Mysql2::Error
      p "kladr error: #{$!}"
    end
    @ui = Ui_Filter.new(self)
    @ui.show
  end

end



$app = Application.new
p "Запущено за: #{Time.new - appTimeStart}"
$app.exec

