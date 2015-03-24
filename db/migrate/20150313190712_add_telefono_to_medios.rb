class AddTelefonoToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :telefono, :string
  end
end
