class AddDescuentoToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :descuento, :decimal
  end
end
