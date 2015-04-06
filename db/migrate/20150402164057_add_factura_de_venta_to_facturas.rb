class AddFacturaDeVentaToFacturas < ActiveRecord::Migration
  def change
    add_column :facturas, :factura_de_venta, :string
  end
end
