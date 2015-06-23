class AddReferenciaPreventaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :referencia_preventa, :string
  end
end
