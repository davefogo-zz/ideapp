class AddFacturarToFacturas < ActiveRecord::Migration
  def change
    add_column :facturas, :facturar, :boolean
  end
end
