class AddVarious3ToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :zona, :string
    add_column :medios, :tipo_de_medio, :string
  end
end
