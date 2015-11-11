class AddGastoRefToPagoItem < ActiveRecord::Migration
  def change
    add_reference :pago_items, :gasto, index: true
    add_foreign_key :pago_items, :gastos
  end
end
