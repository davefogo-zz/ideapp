class RemoveAreaFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :area, :integer
  end
end
