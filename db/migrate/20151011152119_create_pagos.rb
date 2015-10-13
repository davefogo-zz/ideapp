class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.date :fecha
      t.references :factura_proveedor, index: true
      t.references :proveedore, index: true
      t.boolean :gasto
      t.boolean :pagar
      t.integer :importe_pronto_pago, :limit => 8
      t.integer :subtotal, :limit => 8
      t.integer :total, :limit => 8
      t.integer :incentivo_total, :limit => 8

      t.timestamps null: false
    end
    add_foreign_key :pagos, :factura_proveedors
    add_foreign_key :pagos, :proveedores
  end
end
