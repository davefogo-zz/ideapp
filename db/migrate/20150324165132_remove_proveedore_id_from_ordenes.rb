class RemoveProveedoreIdFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :proveedore_id, :integer
  end
end
