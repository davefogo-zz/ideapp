class AddRetIvaToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :ret_iva, :boolean
    add_column :gastos, :importe_ret_iva, :integer, :limit => 8
    add_column :gastos, :gasto_pago, :boolean
  end
end
