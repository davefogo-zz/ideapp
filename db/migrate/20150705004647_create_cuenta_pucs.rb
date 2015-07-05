class CreateCuentaPucs < ActiveRecord::Migration
  def change
    create_table :cuenta_pucs do |t|
      t.integer :cuenta
      t.string :descripcion
      t.references :grupo, index: true

      t.timestamps null: false
    end
    add_foreign_key :cuenta_pucs, :grupos
  end
end
