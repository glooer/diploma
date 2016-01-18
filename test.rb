
$:.unshift(File.dirname(__FILE__))

require "Qt4"

app = Qt::Application.new(ARGV)

settings = Qt::Settings.new("set.ini", Qt::Settings::IniFormat)

settings.beginGroup("test");
settings.setValue("test", Qt::Variant.new("q"))
settings.endGroup();


app.exec