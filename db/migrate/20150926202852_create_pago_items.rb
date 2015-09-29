class CreatePagoItems < ActiveRecord::Migration
  def change
    create_table :pago_items do |t|
      t.references :pago, index: true
      t.references :factura_proveedor, index: true
      t.references :subcuenta_puc_id, index: true
      t.integer :importe, :limit => 8
      t.string :forma_de_pago
      t.boolean :gasto
      t.string :banco
      t.string :numero_de_cheque
      t.integer :importe_pronto_pago, :limit => 8

      t.timestamps null: false
    end
    add_foreign_key :pago_items, :pagos
    add_foreign_key :pago_items, :factura_proveedors
    add_foreign_key :pago_items, :subcuenta_puc_ids
  end
end
