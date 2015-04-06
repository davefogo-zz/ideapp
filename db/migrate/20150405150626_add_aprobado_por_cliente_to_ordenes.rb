class AddAprobadoPorClienteToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :aprobado_por_cliente, :integer
  end
end
