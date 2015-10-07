class AddNumeroDeDocumentoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :numero_de_documento, :string
  end
end
