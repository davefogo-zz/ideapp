class AddCodigoCiiuToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :codigo_ciiu, :string
  end
end
