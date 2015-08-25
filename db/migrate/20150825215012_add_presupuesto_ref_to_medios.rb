class AddPresupuestoRefToMedios < ActiveRecord::Migration
  def change
    add_reference :medios, :presupuesto, index: true
    add_foreign_key :medios, :presupuestos
  end
end
