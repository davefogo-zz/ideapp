class RemoveVariousFromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :nit, :integer
    remove_column :presupuestos, :agencia, :string
    remove_column :presupuestos, :nit_agencia, :integer
    remove_column :presupuestos, :telefono, :string
    remove_column :presupuestos, :direccion, :string
    remove_column :presupuestos, :cliente, :string
  end
end
