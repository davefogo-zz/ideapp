class AddVariousRefToVolumen < ActiveRecord::Migration
  def change
    add_reference :volumen, :medio, index: true
    add_foreign_key :volumen, :medios
    add_reference :volumen, :factura_item, index: true
    add_foreign_key :volumen, :factura_items
  end
end
