class AddCompraActivoToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :compra_de_activo, :boolean
  end
end
