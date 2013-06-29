class CreateMandatos < ActiveRecord::Migration
  def change
    create_table :mandatos do |t|
      t.string :tipo
      t.string :partido
      t.string :uf
      t.string :nome_parlamentar
      t.integer :ano
      t.string :codigo

      t.timestamps
    end
  end
end
