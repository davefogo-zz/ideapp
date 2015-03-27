class RemoveOrdenId2ToProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :orden_id, :integer
  end
end
