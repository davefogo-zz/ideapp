class CreateSubcuentaPucs < ActiveRecord::Migration
  def change
    create_table :subcuenta_pucs do |t|
      t.integer :subcuenta
      t.string :descripcion
      t.references :cuenta_puc, index: true
      t.string :moneda

      t.timestamps null: false
    end
    add_foreign_key :subcuenta_pucs, :cuenta_pucs
  end
end
