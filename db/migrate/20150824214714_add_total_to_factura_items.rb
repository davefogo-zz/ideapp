class AddTotalToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :total, :integer, :limit => 8
  end
end
