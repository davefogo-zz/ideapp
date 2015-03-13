class RemoveDireccionDeFacturacionFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :dirección_de_facturación, :string
  end
end
