class RemoveUnidadFromOrdenes < ActiveRecord::Migration
  def change
    remove_column :ordenes, :unidad, :string
  end
end
