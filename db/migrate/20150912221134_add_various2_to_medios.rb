class AddVarious2ToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :direccion, :string
    add_column :medios, :telefono, :string
  end
end
