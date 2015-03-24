class RemovePresupuestoIdFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :presupuesto_id, :integer
  end
end
