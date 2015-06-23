class AddCantidadToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :cantidad, :integer
  end
end
