class CreateGastos < ActiveRecord::Migration
  def change
    create_table :gastos do |t|
      t.date :fecha_recepcion
      t.references :proveedore, index: true
      t.integer :importe, :limit => 8
      t.integer :iva, :limit => 8
      t.date :fecha_de_vencimiento
      t.references :subcuenta_puc, index: true
      t.boolean :asignar_a_cliente
      t.references :cliente, index: true
      t.boolean :compra_de_activo
      t.references :user, index: true
      t.references :pago, index: true
      t.boolean :pago

      t.timestamps null: false
    end
    add_foreign_key :gastos, :proveedores
    add_foreign_key :gastos, :subcuenta_pucs
    add_foreign_key :gastos, :clientes
    add_foreign_key :gastos, :users
    add_foreign_key :gastos, :pagos
  end
end
