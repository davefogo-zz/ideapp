class AddSubcuentaPucIdToReciboDeCaja < ActiveRecord::Migration
  def change
    add_reference :recibo_de_cajas, :subcuenta_puc, index: true
    add_foreign_key :recibo_de_cajas, :subcuenta_pucs
  end
end
