class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre
      t.string :jefe
      t.references :colaboradore, index: true

      t.timestamps null: false
    end
    add_foreign_key :departamentos, :colaboradores
  end
end
