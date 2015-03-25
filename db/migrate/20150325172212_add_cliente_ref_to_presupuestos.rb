class AddClienteRefToPresupuestos < ActiveRecord::Migration
  def change
    add_reference :presupuestos, :cliente, index: true
    add_foreign_key :presupuestos, :clientes
  end
end
