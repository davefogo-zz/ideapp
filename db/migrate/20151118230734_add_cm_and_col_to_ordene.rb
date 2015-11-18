class AddCmAndColToOrdene < ActiveRecord::Migration
  def change
    add_column :ordenes, :cm, :decimal
    add_column :ordenes, :col, :decimal
  end
end
