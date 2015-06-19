class AddFacturarFromFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :facturar, :boolean
  end
end
