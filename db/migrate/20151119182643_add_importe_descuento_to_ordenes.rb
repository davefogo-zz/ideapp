class AddImporteDescuentoToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :importe_descuento, :integer, :limit => 8
  end
end
