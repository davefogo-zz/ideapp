class AddDireccionToColaboradore < ActiveRecord::Migration
  def change
    add_column :colaboradores, :direccion, :string
  end
end
