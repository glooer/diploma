# coding: utf-8

$:.unshift(File.dirname(__FILE__))

#chcp 65001

require "Qt4"
require "advancedQtClasses.rb"
require "advancedStandartClasses.rb"
require "db.rb"
require "untitled.rb"


class Ui_Filter < Qt::Widget
	slots "edit_lastName_change(int)", "edit_firstName_change(int)", "edit_patrName_change(int)", "edit_birthDate_change(int)", "reset_or_ok(QAbstractButton*)"

	def initialize
		super
		@db = Mysql2::Client.new(:host => "polenkov.ru", :username => "samson", :password => "samson", :database => "s11")
		
		@ui = Ui_Form.new
		@ui.setupUi(self)
		
		connect(@ui.chk_lastName, SIGNAL("stateChanged(int)"), SLOT("edit_lastName_change(int)"))
		connect(@ui.chk_firstName, SIGNAL("stateChanged(int)"), SLOT("edit_firstName_change(int)"))
		connect(@ui.chk_patrName, SIGNAL("stateChanged(int)"), SLOT("edit_patrName_change(int)"))
		connect(@ui.chk_birthDate, SIGNAL("stateChanged(int)"), SLOT("edit_birthDate_change(int)"))
		connect(@ui.reset_or_ok, SIGNAL("clicked(QAbstractButton*)"), SLOT("reset_or_ok(QAbstractButton*)"))
		
	end
	
	def parse_where(input)
		return input.keys.map{ |key| 
			"(`#{key}` #{input[key][1]} '#{input[key].first}')"
		}.join(" and ").force_encoding("UTF-8")
	end
	
	def filter_apply
		timeStartRb = Time.new
		
		where, from = filter_parse
		if where.size.zero?
			return
		end
		w = parse_where(where)
		limit = 1000
		results = @db.query("SELECT SQL_CALC_FOUND_ROWS lastName, firstName, patrName, birthDate, sex FROM Client WHERE #{w} LIMIT #{limit}")
		@db.query("SELECT FOUND_ROWS();").each{|v| p v}
		
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
		from = {}
		#filter[fieldName] = [value, type]
		if @ui.chk_lastName.checked? and (lastName = @ui.edit_lastName.text.strip.trim).any?
			filter["lastName"] = ["%#{lastName}%", "LIKE"]
		end
		
		if @ui.chk_firstName.checked? and (firstName = @ui.edit_firstName.text.strip.trim).any?
			filter["firstName"] = ["%#{firstName}%", "LIKE"]
		end
		
		if @ui.chk_patrName.checked? and (patrName = @ui.edit_patrName.text.strip.trim).any?
			filter["patrName"] = ["%#{patrName}%", "LIKE"]
		end
		
		if @ui.chk_birthDate.checked?
			d = @ui.edit_birthDate.date
			filter["birthDate"] = ["#{d.year}-#{d.month}-#{d.day}", "="]
		end
		
		return [filter, from]
	end
	
	def filter_clear
		@ui.chk_lastName.setChecked(false)
		@ui.chk_firstName.setChecked(false)
		@ui.chk_patrName.setChecked(false)
		@ui.chk_birthDate.setChecked(false)
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
end