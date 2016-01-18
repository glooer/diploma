class String
	def trim
		self.gsub(/\s{2,}/, " ")
	end
	
	def trim!
		self.replace(self.trim)
	end

	def any?
		!self.empty?
	end
end