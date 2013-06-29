class AddPoliticoToMandatos < ActiveRecord::Migration
  def change
    add_column :mandatos, :politico_id, :integer
  end
end
