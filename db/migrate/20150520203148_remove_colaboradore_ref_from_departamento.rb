class RemoveColaboradoreRefFromDepartamento < ActiveRecord::Migration
  def change
    remove_reference :departamentos, :colaboradore, index: true
    remove_foreign_key :departamentos, :colaboradores
  end
end
