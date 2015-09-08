class AddFacturaProveedorRefToPagos < ActiveRecord::Migration
  def change
    add_reference :pagos, :factura_proveedor, index: true
    add_foreign_key :pagos, :factura_proveedors
  end
end
