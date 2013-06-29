class Politico < ActiveRecord::Base
  attr_accessible :data_nascimento, :email, :foto, :nome, :sexo, :uf_nascimento, :midia_social, :contato
  serialize :midia_social, JSON
  serialize :contato, JSON
  has_many :mandatos

  def self.clean_content att
    if att
      att.first
    else
      ''
    end
  end

  def self.get_ano att
    if att
      att.first.split('/').last
    else
      ''
    end
  end
end
