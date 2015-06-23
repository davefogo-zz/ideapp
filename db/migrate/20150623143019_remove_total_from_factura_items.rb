class RemoveTotalFromFacturaItems < ActiveRecord::Migration
  def change
    remove_column :factura_items, :total, :integer
  end
end
