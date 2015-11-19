class RemoveTipoDeMedioFromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :tipo_de_medio, :string
  end
end
