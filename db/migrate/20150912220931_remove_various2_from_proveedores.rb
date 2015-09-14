class RemoveVarious2FromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :direccion, :string
    remove_column :proveedores, :telefono, :string
  end
end
