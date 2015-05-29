class AddMediosRefToFacturaItems < ActiveRecord::Migration
  def change
    add_reference :factura_items, :medio, index: true
    add_foreign_key :factura_items, :medios
  end
end
