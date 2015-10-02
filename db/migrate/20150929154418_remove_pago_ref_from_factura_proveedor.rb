class RemovePagoRefFromFacturaProveedor < ActiveRecord::Migration
  def change
    remove_reference :factura_proveedors, :pago, index: true
    remove_foreign_key :factura_proveedors, :pagos
  end
end
