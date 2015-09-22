class AddIncentivoToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :incentivo, :integer, :limit => 8
  end
end
