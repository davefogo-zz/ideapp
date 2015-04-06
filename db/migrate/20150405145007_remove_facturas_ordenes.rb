class RemoveFacturasOrdenes < ActiveRecord::Migration
  def change
  	drop_table :facturas_ordenes
  end
end
