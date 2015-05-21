class AddDepartamentoRefToColaboradore < ActiveRecord::Migration
  def change
    add_reference :colaboradores, :departamento, index: true
    add_foreign_key :colaboradores, :departamentos
  end
end
