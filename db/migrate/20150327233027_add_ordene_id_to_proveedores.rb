class AddOrdeneIdToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :ordene_id, :integer
  end
end
