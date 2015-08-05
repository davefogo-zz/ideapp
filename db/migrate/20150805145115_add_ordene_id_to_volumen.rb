class AddOrdeneIdToVolumen < ActiveRecord::Migration
  def change
    add_column :volumen, :ordene_id, :integer
  end
end
