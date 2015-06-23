class AddCmToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :cm, :integer
  end
end
