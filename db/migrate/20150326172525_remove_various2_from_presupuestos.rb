class RemoveVarious2FromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :colaboradore_id, :integer
    remove_column :presupuestos, :medio_id, :integer
  end
end
