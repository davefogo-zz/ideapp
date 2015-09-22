class AddFacturadoToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :facturado, :date
  end
end
