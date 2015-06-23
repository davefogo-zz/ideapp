class AddFranjaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :franja, :string
  end
end
