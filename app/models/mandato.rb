class Mandato < ActiveRecord::Base
  attr_accessible :ano, :codigo, :nome_parlamentar, :partido, :tipo, :uf
  belongs_to :politico
end
