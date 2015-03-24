class CreateOrdenes < ActiveRecord::Migration
  def change
    create_table :ordenes do |t|
      t.datetime :fecha_orden
      t.decimal :medida
      t.string :unidad
      t.integer :costo_unidad, :limi => 8
      t.integer :total, :limi => 8
      t.references :presupuesto, index: true

      t.timestamps null: false
    end
    add_foreign_key :ordenes, :presupuestos
  end
end
