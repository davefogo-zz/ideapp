class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :nombre
      t.references :departamento, index: true

      t.timestamps null: false
    end
    add_foreign_key :cargos, :departamentos
  end
end
