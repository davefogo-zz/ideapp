class AddFacturaDeVenta2ToFacturas < ActiveRecord::Migration
  def change
    add_column :facturas, :factura_de_venta, :integer
  end
end
