class RemoveDireccionFromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :dirección, :string
  end
end
