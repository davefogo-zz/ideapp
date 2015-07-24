class AddIvaToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :iva, :integer, :limit => 8
  end
end
