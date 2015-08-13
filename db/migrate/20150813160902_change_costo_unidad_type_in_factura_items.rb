class ChangeCostoUnidadTypeInFacturaItems < ActiveRecord::Migration
  def up
  	change_column :factura_items, :costo_unidad, :integer, :limit => 8
  end

  def down
  	change_column :factura_items, :costo_unidad, :integer
  end
end
