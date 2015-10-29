class AddRetsToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :ret_iva, :integer, :limit => 8
    add_column :factura_items, :ret_ica, :integer, :limit => 8
  end
end
