class AddIvaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :iva, :integer, :limit => 8
  end
end
