class CreatePoliticos < ActiveRecord::Migration
  def change
    create_table :politicos do |t|
      t.string :nome
      t.string :sexo
      t.string :foto
      t.string :email
      t.date :data_nascimento
      t.string :uf_nascimento
      t.string :midia_social
      t.string :contato

      t.timestamps
    end
  end
end
