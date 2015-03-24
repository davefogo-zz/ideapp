class AddContactoFacturacionToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :contacto_facturacion, :string
  end
end
