class RemoveDireccionFromColaboradore < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :dirección, :string
  end
end
