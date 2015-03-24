class CreateProveedores < ActiveRecord::Migration
  def change
    create_table :proveedores do |t|
      t.string :nombre
      t.string :nit
      t.string :dirección
      t.string :teléfono
      t.string :contacto_financiero
      t.string :contacto_comercial

      t.timestamps null: false
    end
  end
end
