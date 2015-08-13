class ChangeImporteFormatInReciboDeCajas < ActiveRecord::Migration
   def up
  	change_column :recibo_de_cajas, :importe, :integer, :limit => 8
  end

  def down
  	change_column :recibo_de_cajas, :importe, :integer
  end
end
