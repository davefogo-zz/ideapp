class AddSubcuentaPucRefToTransaccion < ActiveRecord::Migration
  def change
    add_reference :transaccions, :subcuenta_puc, index: true
    add_foreign_key :transaccions, :subcuenta_pucs
  end
end
