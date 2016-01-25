# coding: utf-8

require "Mysql2"

class Kladr < Mysql2::Client

 ''' 
  def rbDocumentType(type = 1, values = ["*"])
    self.query("SELECT #{values.join(", ")} FROM rbDocumentType WHERE group_id = #{type}")
  end
  
  def rbPolicyType(values = ["*"])
    self.query("SELECT #{values.join(", ")} FROM rbPolicyType")
  end
  
  def rbPolicyKind(values = ["*"])
    self.query("SELECT #{values.join(", ")} FROM rbPolicyKind")
  end
  '''
  def socrbase(type = [1], values = ["*"])
    self.query("SELECT #{values.join(", ")} FROM SOCRBASE WHERE LEVEL in (#{type.join(", ")})")
  end
  
end