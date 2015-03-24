class AddDireccionDeFacturacionToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :direccion_de_facturacion, :string
  end
end
