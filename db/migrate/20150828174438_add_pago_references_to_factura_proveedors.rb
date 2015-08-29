class AddPagoReferencesToFacturaProveedors < ActiveRecord::Migration
  def change
    add_reference :factura_proveedors, :pago, index: true
    add_foreign_key :factura_proveedors, :pagos
  end
end
