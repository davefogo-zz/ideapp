class AddSinIvaToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :sin_iva, :boolean
  end
end
