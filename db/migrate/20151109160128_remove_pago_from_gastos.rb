class RemovePagoFromGastos < ActiveRecord::Migration
  def change
    remove_column :gastos, :pago, :boolean
  end
end
