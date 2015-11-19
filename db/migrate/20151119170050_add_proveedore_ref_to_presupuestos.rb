class AddProveedoreRefToPresupuestos < ActiveRecord::Migration
  def change
    add_reference :presupuestos, :proveedore, index: true
    add_foreign_key :presupuestos, :proveedores
  end
end
