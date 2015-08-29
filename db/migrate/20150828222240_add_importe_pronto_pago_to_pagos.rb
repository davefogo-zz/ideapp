class AddImporteProntoPagoToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :importe_pronto_pago, :integer, :limit => 8
  end
end
