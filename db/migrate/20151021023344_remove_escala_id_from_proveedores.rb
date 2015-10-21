class RemoveEscalaIdFromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :escala_id, :integer
  end
end
