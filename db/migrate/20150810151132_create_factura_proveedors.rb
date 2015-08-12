class CreateFacturaProveedors < ActiveRecord::Migration
  def change
    create_table :factura_proveedors do |t|
      t.date :fecha_recepcion
      t.references :ordene, index: true
      t.references :proveedore, index: true
      t.integer :importe, :limit => 8
      t.boolean :devolucion
      t.decimal :pronto_pago
      t.integer :iva, :limit => 8
      t.date :fecha_vencimiento

      t.timestamps null: false
    end
    add_foreign_key :factura_proveedors, :ordenes
    add_foreign_key :factura_proveedors, :proveedores
  end
end
