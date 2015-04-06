class DropCreateFacturaOrdeneTable < ActiveRecord::Migration
  def change
  	drop_table :factura_ordene_tables
  end
end
