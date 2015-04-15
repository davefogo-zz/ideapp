class DropItemsFacturaTable < ActiveRecord::Migration
  def change
    drop_table :items_factura
  end
end
