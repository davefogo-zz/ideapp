class AddDireccionToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :direccion, :string
  end
end
