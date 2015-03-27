class RemoveMediosIdFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :medio_id, :integer
  end
end
