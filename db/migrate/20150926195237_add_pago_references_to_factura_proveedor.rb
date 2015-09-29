class AddPagoReferencesToFacturaProveedor < ActiveRecord::Migration
  def change
    add_reference :factura_proveedors, :factura_proveedor, index: true
    add_foreign_key :factura_proveedors, :factura_proveedors
  end
end
