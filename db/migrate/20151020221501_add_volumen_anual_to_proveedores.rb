class AddVolumenAnualToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :volumen_anual, :string
  end
end
