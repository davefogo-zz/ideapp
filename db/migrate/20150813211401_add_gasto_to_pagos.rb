class AddGastoToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :gasto, :boolean
  end
end
