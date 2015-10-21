class RemoveVolumenAnualFromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :volumen_anual, :string
    remove_column :proveedores, :cobro_volumen, :string
  end
end
