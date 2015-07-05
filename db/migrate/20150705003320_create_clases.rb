class CreateClases < ActiveRecord::Migration
  def change
    create_table :clases do |t|
      t.integer :clase
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
