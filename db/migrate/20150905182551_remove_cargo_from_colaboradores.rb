class RemoveCargoFromColaboradores < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :cargo, :string
  end
end
