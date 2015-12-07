class AddTotalsToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :subtotal, :integer, :limit => 8
    add_column :presupuestos, :iva, :integer, :limit => 8
    add_column :presupuestos, :total, :integer, :limit => 8
  end
end
