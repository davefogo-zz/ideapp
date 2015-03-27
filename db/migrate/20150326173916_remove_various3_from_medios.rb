class RemoveVarious3FromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :contacto_comercial, :string
  end
end
