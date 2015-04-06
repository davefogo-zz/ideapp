class Drop2CreateFacturaOrdeneTable < ActiveRecord::Migration
  def change
  	drop_table :factura_ordenes
  end
end
