class AddNumeroDeFacturaToFacturaProveedors < ActiveRecord::Migration
  def change
    add_column :factura_proveedors, :numero_de_factura, :integer
  end
end
