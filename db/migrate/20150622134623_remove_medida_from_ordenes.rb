class RemoveMedidaFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :medida, :decimal
  end
end
