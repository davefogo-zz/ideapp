class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.integer :grupo
      t.string :descripcion
      t.references :clase, index: true

      t.timestamps null: false
    end
    add_foreign_key :grupos, :clases
  end
end
