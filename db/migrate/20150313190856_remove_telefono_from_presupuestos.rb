class RemoveTelefonoFromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :teléfono, :string
  end
end
