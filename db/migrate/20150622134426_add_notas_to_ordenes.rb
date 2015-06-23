class AddNotasToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :notas, :string
  end
end
