class AddDireccionToProveedor < ActiveRecord::Migration
  def change
    add_column :proveedores, :direccion, :string
  end
end
