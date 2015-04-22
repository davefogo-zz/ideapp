class AddClienteRefToFacturas < ActiveRecord::Migration
  def change
    add_reference :facturas, :cliente, index: true
    add_foreign_key :facturas, :clientes
  end
end
