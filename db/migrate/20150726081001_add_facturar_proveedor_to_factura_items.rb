class AddFacturarProveedorToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :facturar_proveedor, :boolean
  end
end
