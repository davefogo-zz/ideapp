class AddPresupuestoRefToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :presupuesto, index: true
    add_foreign_key :ordenes, :presupuestos
  end
end
