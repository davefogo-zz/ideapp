class AddDescuentoToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :descuento, :decimal
  end
end
