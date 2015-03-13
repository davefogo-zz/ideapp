class AddTelefonoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :telefono, :string
  end
end
