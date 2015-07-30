class AddFacturaItemRefToTransaccions < ActiveRecord::Migration
  def change
    add_reference :transaccions, :factura_item, index: true
    add_foreign_key :transaccions, :factura_items
  end
end
