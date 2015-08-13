class RemoveAutorizadoPorRefFromGastos < ActiveRecord::Migration
  def change
    remove_reference :gastos, :autorizado_por, index: true
    remove_foreign_key :gastos, :autorizado_pors
  end
end
