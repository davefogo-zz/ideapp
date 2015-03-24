class CreateMedios < ActiveRecord::Migration
  def change
    create_table :medios do |t|
      t.string :nombre
      t.string :nit
      t.string :dirección
      t.string :teléfono
      t.string :contacto_financiero
      t.string :contacto_comercial
      t.references :proveedore, index: true

      t.timestamps null: false
    end
    add_foreign_key :medios, :proveedores
  end
end
