class MSettings < Qt::Settings
  def initialize(fileName = nil, fileType = nil)
    super
  end

  def [](name, default = nil)
    self.value(name, Qt::Variant.new(default)).value
  end
  
  def []=(name, value)
    self.setValue(name, Qt::Variant.new(value))
  end
  
end