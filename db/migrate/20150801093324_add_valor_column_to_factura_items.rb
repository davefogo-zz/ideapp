class AddValorColumnToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :valor, :integer, :limit => 8
  end
end
