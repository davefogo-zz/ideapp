class AddFacturaRefToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :factura, index: true
    add_foreign_key :ordenes, :facturas
  end
end
