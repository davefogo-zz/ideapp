class RemoveVarious4FromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :telefono, :string
    remove_column :medios, :direccion, :string
  end
end
