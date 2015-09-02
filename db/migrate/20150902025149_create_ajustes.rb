class CreateAjustes < ActiveRecord::Migration
  def change
    create_table :ajustes do |t|
      t.date :fecha
      t.references :cliente, index: true
      t.references :proveedore, index: true

      t.timestamps null: false
    end
    add_foreign_key :ajustes, :clientes
    add_foreign_key :ajustes, :proveedores
  end
end
