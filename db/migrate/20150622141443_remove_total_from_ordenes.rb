class RemoveTotalFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :total, :integer
  end
end
