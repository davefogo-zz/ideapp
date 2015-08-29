class RemoveGastoRefFromPagos < ActiveRecord::Migration
  def change
    remove_reference :pagos, :gasto, index: true
    remove_foreign_key :pagos, :gastos
  end
end
