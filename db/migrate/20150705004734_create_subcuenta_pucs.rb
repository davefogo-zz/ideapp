class CreateSubcuentaPucs < ActiveRecord::Migration
  def change
    create_table :subcuenta_pucs do |t|
      t.integer :subcuenta
      t.string :descripcion
      t.references :CuentaPuc, index: true

      t.timestamps null: false
    end
    add_foreign_key :subcuenta_pucs, :CuentaPucs
  end
end
