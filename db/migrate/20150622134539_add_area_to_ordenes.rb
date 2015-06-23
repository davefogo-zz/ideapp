class AddAreaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :area, :integer
  end
end
