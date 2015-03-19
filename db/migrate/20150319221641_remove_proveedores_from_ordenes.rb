class RemoveProveedoresFromOrdenes < ActiveRecord::Migration
  def change
    remove_reference :ordenes, :proveedore, index: true
    remove_foreign_key :ordenes, :proveedores
  end
end
