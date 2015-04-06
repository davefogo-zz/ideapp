class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.integer :factura_de_venta

      t.timestamps null: false
    end
  end
end
