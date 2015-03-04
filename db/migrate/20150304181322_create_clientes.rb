class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :nit
      t.string :dirección_de_facturación
      t.string :teléfono
      t.string :tipo_de_cliente
      t.string :contacto_comercial
      t.string :contacto_facturación
      t.integer :cupo_de_crédito, :limit => 8
      t.references :colaboradore, index: true

      t.timestamps null: false
    end
    add_foreign_key :clientes, :colaboradores
  end
end
