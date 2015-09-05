class RemoveDepartamentoFromColaboradores < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :departamento, :string
  end
end
