# coding: utf-8

$:.unshift(File.dirname(__FILE__))

require "Qt4"
require "unitiled_module.rb"


app = Qt::Application.new(ARGV)

main = Ui_Filter.new
main.show

app.exec