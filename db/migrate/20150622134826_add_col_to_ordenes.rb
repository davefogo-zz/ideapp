class AddColToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :col, :integer
  end
end
