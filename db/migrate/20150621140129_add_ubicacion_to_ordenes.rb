class AddUbicacionToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :ubicacion, :string
  end
end
