class AddGastoToProveedore < ActiveRecord::Migration
  def change
    add_column :proveedores, :gasto, :boolean
  end
end
