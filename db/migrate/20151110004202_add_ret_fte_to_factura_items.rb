class AddRetFteToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :ret_fte, :integer, :limit => 8
  end
end
