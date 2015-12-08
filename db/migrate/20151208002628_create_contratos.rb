class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.references :cliente, index: true
      t.references :proveedore, index: true
      t.string :tipo_de_medio
      t.date :desde
      t.date :hasta
      t.string :descripcion
      t.string :tipo
      t.string :tipo_de_consumo
      t.string :tipo_de_control
      t.string :notas
      t.integer :monto, :limit => 8
      t.integer :iva, :limit => 8
      t.integer :total, :limit => 8
      t.string :numero_de_contrato
      t.integer :saldo, :limit => 8

      t.timestamps null: false
    end
    add_foreign_key :contratos, :clientes
    add_foreign_key :contratos, :proveedores
  end
end
