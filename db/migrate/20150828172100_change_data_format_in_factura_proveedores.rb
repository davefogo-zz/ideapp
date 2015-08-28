class ChangeDataFormatInFacturaProveedores < ActiveRecord::Migration
  def up
  	change_column :factura_proveedors, :numero_de_factura, :string
  end

  def down
  	change_column :factura_proveedors, :numero_de_factura, :integer
  end
end
