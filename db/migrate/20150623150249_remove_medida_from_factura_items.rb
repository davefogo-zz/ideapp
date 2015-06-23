class RemoveMedidaFromFacturaItems < ActiveRecord::Migration
  def change
    remove_column :factura_items, :medida, :integer
  end
end
