class CreateReciboDeCajas < ActiveRecord::Migration
  def change
    create_table :recibo_de_cajas do |t|
      t.date :fecha
      t.references :factura, index: true
      t.integer :importe
      t.string :concepto
      t.string :forma_de_pago

      t.timestamps null: false
    end
    add_foreign_key :recibo_de_cajas, :facturas
  end
end
