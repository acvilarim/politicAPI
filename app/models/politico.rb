class Politico < ActiveRecord::Base
  attr_accessible :data_nascimento, :email, :foto, :nome, :sexo, :uf_nascimento, :midia_social, :contato
  serialize :midia_social, JSON
  serialize :contato, JSON
end
