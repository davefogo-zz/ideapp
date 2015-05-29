class AddVariousToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :fecha_orden, :date
    add_column :factura_items, :medida, :decimal
    add_column :factura_items, :unidad, :string
    add_column :factura_items, :costo_unidad, :integer
    add_column :factura_items, :total, :integer
  end
end
