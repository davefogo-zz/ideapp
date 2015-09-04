class AddClienteRefToReciboDeCajas < ActiveRecord::Migration
  def change
    add_reference :recibo_de_cajas, :cliente, index: true
    add_foreign_key :recibo_de_cajas, :clientes
  end
end
