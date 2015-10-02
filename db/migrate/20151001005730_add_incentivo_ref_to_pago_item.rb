class AddIncentivoRefToPagoItem < ActiveRecord::Migration
  def change
    add_reference :pago_items, :incentivo, index: true
    add_foreign_key :pago_items, :incentivos
  end
end
