class AddTelefonoToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :telefono, :string
  end
end
