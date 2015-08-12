class RemoveProntoPagoFromFacturaProveedors < ActiveRecord::Migration
  def change
    remove_column :factura_proveedors, :pronto_pago, :decimal
  end
end
