class AddCantidadToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :cantidad, :integer
  end
end
