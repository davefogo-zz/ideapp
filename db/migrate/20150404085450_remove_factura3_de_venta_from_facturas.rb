class RemoveFactura3DeVentaFromFacturas < ActiveRecord::Migration
  def change
    remove_column :facturas, :factura_de_venta, :integer
  end
end
