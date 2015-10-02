class AddPagoItemRefToFacturaProveedor < ActiveRecord::Migration
  def change
    add_reference :factura_proveedors, :pago_item, index: true
    add_foreign_key :factura_proveedors, :pago_items
  end
end
