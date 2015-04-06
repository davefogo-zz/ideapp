class AddFechaDeExpedicionToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :fecha_de_expedicion, :datetime
  end
end
