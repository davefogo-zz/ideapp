class AddDuracionToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :duracion, :integer
  end
end
