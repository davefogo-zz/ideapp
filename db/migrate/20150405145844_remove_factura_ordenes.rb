class RemoveFacturaOrdenes < ActiveRecord::Migration
  def change
  	drop_table :factura_ordenes
  end
end
