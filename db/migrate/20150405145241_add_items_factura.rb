class AddItemsFactura < ActiveRecord::Migration
  def change
  	create_table :items_factura do |t|
  	t.references :factura, index: true, foreign_key: true	
  	t.datetime :fecha_orden
  	t.integer :revisado

  	t.timestamps null: false
  end	
  end
end
