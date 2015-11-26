class AddOrdenItemRefToFacturaItems < ActiveRecord::Migration
  def change
    add_reference :factura_items, :orden_item, index: true
    add_foreign_key :factura_items, :orden_items
  end
end
