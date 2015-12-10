class AddNumeroDeDocumentoToTransaccions < ActiveRecord::Migration
  def change
    add_column :transaccions, :numero_de_documento, :string
  end
end
