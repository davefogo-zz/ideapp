class RemoveCmAndColFromOrdene < ActiveRecord::Migration
  def change
    remove_column :ordenes, :cm, :integer
    remove_column :ordenes, :col, :integer
  end
end
