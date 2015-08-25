class RemoveVarious3FromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :aprobado_por_cliente, :integer
    remove_column :ordenes, :emision_certificada, :integer
  end
end
