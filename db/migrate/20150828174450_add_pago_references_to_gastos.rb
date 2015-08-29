class AddPagoReferencesToGastos < ActiveRecord::Migration
  def change
    add_reference :gastos, :pago, index: true
    add_foreign_key :gastos, :pagos
  end
end
