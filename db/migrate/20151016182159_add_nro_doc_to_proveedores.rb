class AddNroDocToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :numero_de_documento, :string
  end
end
