class AddProveedoreRefToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :proveedore, index: true
    add_foreign_key :ordenes, :proveedores
  end
end
