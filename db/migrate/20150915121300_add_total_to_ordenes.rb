class AddTotalToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :total, :integer, :limit => 8
  end
end
