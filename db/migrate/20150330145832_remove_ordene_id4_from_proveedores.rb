class RemoveOrdeneId4FromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :ordene_id, :integer
  end
end
