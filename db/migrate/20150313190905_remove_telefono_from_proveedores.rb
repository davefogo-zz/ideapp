class RemoveTelefonoFromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :teléfono, :string
  end
end
