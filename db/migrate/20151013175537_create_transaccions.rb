class CreateTransaccions < ActiveRecord::Migration
  def change
    create_table :transaccions do |t|
      t.date :fecha
      t.references :cliente, index: true
      t.integer :debito, :limit => 8
      t.integer :credito, :limit => 8
      t.references :presupuesto, index: true
      t.references :subcuenta_puc, index: true
      t.references :factura_item, index: true
      t.references :pago, index: true
      t.references :recibo_de_caja, index: true
      t.references :gasto, index: true
      t.references :factura_proveedor, index: true
      t.references :proveedore, index: true
      t.references :ajuste, index: true
      t.references :recibo_item, index: true

      t.timestamps null: false
    end
    add_foreign_key :transaccions, :clientes
    add_foreign_key :transaccions, :presupuestos
    add_foreign_key :transaccions, :subcuenta_pucs
    add_foreign_key :transaccions, :factura_items
    add_foreign_key :transaccions, :pagos
    add_foreign_key :transaccions, :recibo_de_cajas
    add_foreign_key :transaccions, :gastos
    add_foreign_key :transaccions, :factura_proveedors
    add_foreign_key :transaccions, :proveedores
    add_foreign_key :transaccions, :ajustes
    add_foreign_key :transaccions, :recibo_items
  end
end
