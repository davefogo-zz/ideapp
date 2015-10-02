class RemovePagoItemRefFromFacturaProveedor < ActiveRecord::Migration
  def change
    remove_reference :factura_proveedors, :factura_proveedor, index: true
    remove_foreign_key :factura_proveedors, :factura_proveedors
  end
end
