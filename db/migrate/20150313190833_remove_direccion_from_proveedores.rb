class RemoveDireccionFromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :dirección, :string
  end
end
