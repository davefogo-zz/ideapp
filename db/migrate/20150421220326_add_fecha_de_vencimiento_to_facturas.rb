class AddFechaDeVencimientoToFacturas < ActiveRecord::Migration
  def change
    add_column :facturas, :fecha_de_vencimiento, :date
  end
end
