class AddNotasToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :notas, :string
  end
end
