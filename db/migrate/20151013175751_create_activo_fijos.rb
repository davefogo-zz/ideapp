class CreateActivoFijos < ActiveRecord::Migration
  def change
    create_table :activo_fijos do |t|
      t.date :fecha_de_compra
      t.references :gasto, index: true
      t.string :vida_util
      t.integer :importe,:limit => 8
      t.string :depreciacion
      t.string :descripcion

      t.timestamps null: false
    end
    add_foreign_key :activo_fijos, :gastos
  end
end
