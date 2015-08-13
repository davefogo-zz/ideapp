class ChangeCostoUnidadFormatInOrdenes < ActiveRecord::Migration
  def up
  	change_column :ordenes, :costo_unidad, :integer, :limit => 8
  end

  def down
  	change_column :ordenes, :costo_unidad, :integer
  end
end
