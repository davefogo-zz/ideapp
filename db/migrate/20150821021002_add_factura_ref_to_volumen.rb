class AddFacturaRefToVolumen < ActiveRecord::Migration
  def change
    add_reference :volumen, :factura, index: true
    add_foreign_key :volumen, :facturas
  end
end
