class AddCobroVolumenToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :cobro_volumen, :string
  end
end
