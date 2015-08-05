class AddSubtotalToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :subtotal, :integer, :limit => 8
  end
end
