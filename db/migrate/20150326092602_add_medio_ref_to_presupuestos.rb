class AddMedioRefToPresupuestos < ActiveRecord::Migration
  def change
    add_reference :presupuestos, :medio, index: true
    add_foreign_key :presupuestos, :medios
  end
end
