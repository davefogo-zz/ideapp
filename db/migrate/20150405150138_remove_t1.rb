class RemoveT1 < ActiveRecord::Migration
  def change
  	drop_table :t1
  end
end
