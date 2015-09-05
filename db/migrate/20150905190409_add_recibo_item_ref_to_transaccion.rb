class AddReciboItemRefToTransaccion < ActiveRecord::Migration
  def change
    add_reference :transaccions, :recibo_item, index: true
    add_foreign_key :transaccions, :recibo_items
  end
end
