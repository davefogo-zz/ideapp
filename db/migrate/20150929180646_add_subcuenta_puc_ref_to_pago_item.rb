class AddSubcuentaPucRefToPagoItem < ActiveRecord::Migration
  def change
    add_reference :pago_items, :subcuenta_puc, index: true
    add_foreign_key :pago_items, :subcuenta_pucs
  end
end
