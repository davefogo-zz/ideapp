class CreateReciboItems < ActiveRecord::Migration
  def change
    create_table :recibo_items do |t|
      t.references :recibo_de_caja, index: true
      t.references :factura, index: true
      t.string :forma_de_pago
      t.string :numero_de_cheque
      t.integer :importe, :limit => 8
      t.date :fecha
      t.references :subucenta_puc, index: true

      t.timestamps null: false
    end
    add_foreign_key :recibo_items, :recibo_de_cajas
    add_foreign_key :recibo_items, :facturas
    add_foreign_key :recibo_items, :subucenta_pucs
  end
end
