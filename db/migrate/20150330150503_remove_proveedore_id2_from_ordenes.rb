class RemoveProveedoreId2FromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :proveedore_id_id, :integer
  end
end
