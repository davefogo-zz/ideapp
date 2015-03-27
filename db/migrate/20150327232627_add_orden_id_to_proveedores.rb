class AddOrdenIdToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :orden_id, :integer
  end
end
