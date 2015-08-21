class RemoveColaboradoreRefFromGastos < ActiveRecord::Migration
  def change
    remove_reference :gastos, :colaboradore, index: true
    remove_foreign_key :gastos, :colaboradores
  end
end
