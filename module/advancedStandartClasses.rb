require "unicode";
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
  
  def downcase
    Unicode::downcase(self)
  end
  
  def downcase!
    self.replace downcase
  end
  
  def upcase
    Unicode::upcase(self)
  end
  
  def upcase!
    self.replace upcase
  end
  
  def capitalize
    Unicode::capitalize(self)
  end
  
  def capitalize!
    self.replace capitalize
  end  
end