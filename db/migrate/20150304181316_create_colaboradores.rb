class CreateColaboradores < ActiveRecord::Migration
  def change
    create_table :colaboradores do |t|
      t.string :nombre
      t.string :cédula
      t.string :dirección
      t.string :teléfono_personal
      t.string :teléfono_empresa
      t.string :cargo
      t.string :departamento
      t.string :jefe_inmediato

      t.timestamps null: false
    end
  end
end
