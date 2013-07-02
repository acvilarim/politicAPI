class CreateOrgaos < ActiveRecord::Migration
  def change
    create_table :orgaos do |t|
      t.integer :codigo
      t.string :sigla
      t.string :descricao

      t.timestamps
    end
    add_index :orgaos, :codigo, :uniqueness => true
  end
end
