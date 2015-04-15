class CreateFacturaItems < ActiveRecord::Migration
  def change
    create_table :factura_items do |t|
      t.references :factura, index: true
      t.references :ordene, index: true

      t.timestamps null: false
    end
    add_foreign_key :factura_items, :facturas
    add_foreign_key :factura_items, :ordenes
  end
end
