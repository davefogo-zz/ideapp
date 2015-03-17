class RemoveEjecutivoFromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :ejecutivo, :string
  end
end
