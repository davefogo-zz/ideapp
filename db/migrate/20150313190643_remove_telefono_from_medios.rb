class RemoveTelefonoFromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :teléfono, :string
  end
end
