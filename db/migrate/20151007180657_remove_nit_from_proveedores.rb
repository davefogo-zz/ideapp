class RemoveNitFromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :nit, :string
  end
end
