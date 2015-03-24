class RemoveContactoFacturacionFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :contacto_facturación, :string
  end
end
