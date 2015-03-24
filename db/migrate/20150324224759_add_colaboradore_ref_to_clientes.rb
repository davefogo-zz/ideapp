class AddColaboradoreRefToClientes < ActiveRecord::Migration
  def change
    add_reference :clientes, :colaboradore, index: true
    add_foreign_key :clientes, :colaboradores
  end
end
