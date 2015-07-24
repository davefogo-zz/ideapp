class AddSubtotalToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :subtotal, :integer, :limit => 8
  end
end
