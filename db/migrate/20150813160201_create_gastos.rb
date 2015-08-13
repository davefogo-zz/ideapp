class CreateGastos < ActiveRecord::Migration
  def change
    create_table :gastos do |t|
      t.date :fecha_recepcion
      t.references :proveedore, index: true
      t.integer :importe, :limit => 8
      t.integer :iva, :limit => 8
      t.references :autorizado_por, index: true
      t.date :fecha_de_vencimiento
      t.references :subcuenta_puc, index: true
      t.boolean :asignar_a_cliente
      t.references :cliente, index: true

      t.timestamps null: false
    end
    add_foreign_key :gastos, :proveedores
    add_foreign_key :gastos, :autorizado_pors
    add_foreign_key :gastos, :subcuenta_pucs
    add_foreign_key :gastos, :clientes
  end
end
