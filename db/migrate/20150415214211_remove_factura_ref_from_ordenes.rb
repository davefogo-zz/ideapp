class RemoveFacturaRefFromOrdenes < ActiveRecord::Migration
  def change
    remove_reference :ordenes, :factura, index: true
    remove_foreign_key :ordenes, :facturas
  end
end
