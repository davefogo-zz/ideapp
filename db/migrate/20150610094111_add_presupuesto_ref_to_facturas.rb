class AddPresupuestoRefToFacturas < ActiveRecord::Migration
  def change
    add_reference :facturas, :presupuesto, index: true
    add_foreign_key :facturas, :presupuestos
  end
end
