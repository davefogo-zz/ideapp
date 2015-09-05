class RemoveUsersRefFromClientes < ActiveRecord::Migration
  def change
    remove_reference :clientes, :users, index: true
    remove_foreign_key :clientes, :users
  end
end
