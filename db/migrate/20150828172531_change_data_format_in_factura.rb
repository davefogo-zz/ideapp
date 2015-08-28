class ChangeDataFormatInFactura < ActiveRecord::Migration
   def up
  	change_column :facturas, :fecha_de_expedicion, :date
  end

  def down
  	change_column :facturas, :fecha_de_expedicion, :datetime
  end
end
