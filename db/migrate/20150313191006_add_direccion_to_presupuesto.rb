class AddDireccionToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :direccion, :string
  end
end
