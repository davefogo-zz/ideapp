class DropAutoIncrement < ActiveRecord::Migration
  def change
  	drop_table :custom_auto_increments
  end
end
