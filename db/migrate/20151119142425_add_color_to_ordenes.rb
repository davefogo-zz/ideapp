class AddColorToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :color, :string
  end
end
