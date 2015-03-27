class RemoveVarious2FromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :contacto_financiero, :string
    remove_column :medios, :contacto_financiero, :string
  end
end
