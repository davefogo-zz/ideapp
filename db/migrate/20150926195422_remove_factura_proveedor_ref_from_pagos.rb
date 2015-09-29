class RemoveFacturaProveedorRefFromPagos < ActiveRecord::Migration
  def change
    remove_reference :pagos, :factura_proveedor, index: true
    remove_foreign_key :pagos, :factura_proveedors
  end
end
