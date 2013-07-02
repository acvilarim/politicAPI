class Orgao < ActiveRecord::Base
  attr_accessible :codigo, :descricao, :sigla
  
  validates_uniqueness_of :codigo
  
  validates_presence_of :codigo
  
  def self.clean(content)
  	content.nil? ? '' : content.strip
  end
  
end
