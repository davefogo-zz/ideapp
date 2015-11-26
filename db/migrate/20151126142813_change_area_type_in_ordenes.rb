class ChangeAreaTypeInOrdenes < ActiveRecord::Migration
  def up
  	change_column :ordenes, :area, :decimal
  end

  def down
  	change_column :ordenes, :area, :integer
  end
end
