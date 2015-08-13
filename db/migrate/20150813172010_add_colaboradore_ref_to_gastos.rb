class AddColaboradoreRefToGastos < ActiveRecord::Migration
  def change
    add_reference :gastos, :colaboradore, index: true
    add_foreign_key :gastos, :colaboradores
  end
end
