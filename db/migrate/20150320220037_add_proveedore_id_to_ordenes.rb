class AddProveedoreIdToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :proveedore_id, :integer
  end
end
