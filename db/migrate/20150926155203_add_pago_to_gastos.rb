class AddPagoToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :pago, :boolean
  end
end
