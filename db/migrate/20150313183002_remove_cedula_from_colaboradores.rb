class RemoveCedulaFromColaboradores < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :cédula, :string
  end
end
