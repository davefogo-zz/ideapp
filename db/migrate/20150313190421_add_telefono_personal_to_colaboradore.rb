class AddTelefonoPersonalToColaboradore < ActiveRecord::Migration
  def change
    add_column :colaboradores, :telefono_personal, :string
  end
end
