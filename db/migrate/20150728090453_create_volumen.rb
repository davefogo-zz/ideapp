class CreateVolumen < ActiveRecord::Migration
  def change
    create_table :volumen do |t|
      t.references :medio_id, index: true
      t.string :tipo_de_volumen
      t.decimal :escala
      t.string :rango
      t.string :cobro
      t.references :factura_item_id, index: true
      t.integer :valor

      t.timestamps null: false
    end
    add_foreign_key :volumen, :medio_ids
    add_foreign_key :volumen, :factura_item_ids
  end
end
