class RemoveTelefonoFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :teléfono, :string
  end
end
