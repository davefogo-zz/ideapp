class CreateReciboDeCajas < ActiveRecord::Migration
  def change
    create_table :recibo_de_cajas do |t|
      t.date :fecha
      t.references :cliente, index: true

      t.timestamps null: false
    end
    add_foreign_key :recibo_de_cajas, :clientes
  end
end
