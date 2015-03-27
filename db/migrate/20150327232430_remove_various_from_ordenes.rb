class RemoveVariousFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :proveedore_id, :integer
    remove_column :ordenes, :medio_id, :integer
  end
end
