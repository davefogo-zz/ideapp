class AddPresupuestoIdColumnToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :presupuesto_id, :integer
  end
end
