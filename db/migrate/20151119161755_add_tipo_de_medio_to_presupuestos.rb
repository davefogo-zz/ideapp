class AddTipoDeMedioToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :tipo_de_medio, :string
  end
end
