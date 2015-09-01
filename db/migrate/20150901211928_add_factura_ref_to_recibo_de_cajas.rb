class AddFacturaRefToReciboDeCajas < ActiveRecord::Migration
  def change
    add_reference :recibo_de_cajas, :factura, index: true
    add_foreign_key :recibo_de_cajas, :facturas
  end
end
