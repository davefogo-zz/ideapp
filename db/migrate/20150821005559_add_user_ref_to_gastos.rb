class AddUserRefToGastos < ActiveRecord::Migration
  def change
    add_reference :gastos, :user, index: true
    add_foreign_key :gastos, :users
  end
end
