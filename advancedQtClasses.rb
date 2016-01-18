# coding: utf-8

require "Qt4"

class Qt::CheckBox
	def checked?
		self.checked
	end
end