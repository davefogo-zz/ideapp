class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.datetime :fecha
      t.string :cliente
      t.string :nit
      t.string :dirección
      t.string :teléfono
      t.string :contacto_financiero
      t.string :contacto_comercial
      t.string :ejecutivo
      t.string :agencia
      t.string :nit_agencia
      t.string :titulo
      t.string :producto
      t.references :colaboradore, index: true

      t.timestamps null: false
    end
    add_foreign_key :presupuestos, :colaboradores
  end
end
