class RemoveFactura2DeVentaFromFacturas < ActiveRecord::Migration
  def change
    remove_column :facturas, :factura_de_venta, :string
  end
end
