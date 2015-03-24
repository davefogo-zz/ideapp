class RemoveDireccionFromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :dirección, :string
  end
end
