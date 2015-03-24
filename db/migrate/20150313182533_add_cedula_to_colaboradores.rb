class AddCedulaToColaboradores < ActiveRecord::Migration
  def change
    add_column :colaboradores, :cedula, :string
  end
end
