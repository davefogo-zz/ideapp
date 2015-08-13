class ChangeVariousFormatsInTransaccions < ActiveRecord::Migration
   def up
  	change_column :transaccions, :credito, :integer, :limit => 8
  	change_column :transaccions, :debito, :integer, :limit => 8
  end

  def down
  	change_column :transaccions, :credito, :integer
  	change_column :transaccions, :debito, :integer
  end
end
