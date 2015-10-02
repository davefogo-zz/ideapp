class RemoveSubcuentaPucIdRefFromPagoItem < ActiveRecord::Migration
  def change
    remove_reference :pago_items, :subcuenta_puc_id, index: true
    remove_foreign_key :pago_items, :subcuenta_puc_ids
  end
end
