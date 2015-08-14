class AddImporteProntoPagoToFacturaProveedors < ActiveRecord::Migration
  def change
    add_column :factura_proveedors, :importe_pronto_pago, :integer, :limit => 8
  end
end
