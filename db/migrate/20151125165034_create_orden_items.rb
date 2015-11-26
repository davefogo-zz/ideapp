class CreateOrdenItems < ActiveRecord::Migration
  def change
    create_table :orden_items do |t|
      t.date :fecha_item
      t.integer :costo_unidad
      t.references :factura, index: true
      t.references :medio, index: true
      t.integer :cantidad
      t.string :cobertura
      t.string :referencia_preventa
      t.string :ubicacion
      t.decimal :descuento
      t.string :formato
      t.string :notas
      t.integer :subtotal
      t.boolean :aprobado_por_cliente
      t.integer :iva
      t.integer :total
      t.date :facturado
      t.integer :incentivo
      t.decimal :cm
      t.decimal :col
      t.string :color
      t.integer :importe_descuento
      t.integer :area

      t.timestamps null: false
    end
    add_foreign_key :orden_items, :facturas
    add_foreign_key :orden_items, :medios
  end
end
