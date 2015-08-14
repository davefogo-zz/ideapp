class AddGastoRefToPagos < ActiveRecord::Migration
  def change
    add_reference :pagos, :gasto, index: true
    add_foreign_key :pagos, :gastos
  end
end
