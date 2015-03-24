class RemoveColaboradoreFromClientes < ActiveRecord::Migration
  def change
    remove_reference :clientes, :colaboradore, index: true
    remove_foreign_key :clientes, :colaboradores
  end
end
