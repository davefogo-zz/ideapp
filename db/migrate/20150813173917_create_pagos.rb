class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.date :fecha
      t.references :proveedore, index: true
      t.references :factura_proveedor, index: true
      t.references :subcuenta_puc, index: true

      t.timestamps null: false
    end
    add_foreign_key :pagos, :proveedores
    add_foreign_key :pagos, :factura_proveedors
    add_foreign_key :pagos, :subcuenta_pucs
  end
end
