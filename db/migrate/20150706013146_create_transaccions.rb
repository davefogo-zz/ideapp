class CreateTransaccions < ActiveRecord::Migration
  def change
    create_table :transaccions do |t|
      t.date :fecha
      t.integer :comprobante
      t.integer :cliente_id
      t.references :subcuenta, index: true
      t.integer :debito
      t.integer :credito
      t.integer :presupuesto_id

      t.timestamps null: false
    end
    add_foreign_key :transaccions, :subcuenta
  end
end
