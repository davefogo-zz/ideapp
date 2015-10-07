class AddNotasToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :notas, :string
  end
end
