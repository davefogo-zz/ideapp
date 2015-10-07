class RemoveNitFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :nit, :string
  end
end
