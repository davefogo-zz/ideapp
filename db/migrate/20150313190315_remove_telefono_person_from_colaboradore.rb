class RemoveTelefonoPersonFromColaboradore < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :teléfono_personal, :string
  end
end
