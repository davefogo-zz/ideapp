class AddEstadoToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :estado, :string
  end
end
