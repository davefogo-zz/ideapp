class AddUbicacionToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :ubicacion, :string
  end
end
