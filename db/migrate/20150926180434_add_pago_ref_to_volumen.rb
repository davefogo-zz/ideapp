class AddPagoRefToVolumen < ActiveRecord::Migration
  def change
    add_reference :volumen, :pago, index: true
    add_foreign_key :volumen, :pagos
  end
end
