class RemoveNitFromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :nit, :string
  end
end
