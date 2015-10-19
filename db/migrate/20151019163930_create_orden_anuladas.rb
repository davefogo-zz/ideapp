class CreateOrdenAnuladas < ActiveRecord::Migration
  def change
    create_table :orden_anuladas do |t|
      t.date :fecha_orden
      t.integer :orden_reemplazada
      t.string :unidad
      t.integer :costo_unidad
      t.integer :presupuesto
      t.integer :cantidad
      t.decimal :descuento
      t.integer :iva
      t.integer :total

      t.timestamps null: false
    end
  end
end
