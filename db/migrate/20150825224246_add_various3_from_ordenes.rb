class AddVarious3FromOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :aprobado_por_cliente, :boolean
    add_column :ordenes, :emision_certificada, :boolean
  end
end
