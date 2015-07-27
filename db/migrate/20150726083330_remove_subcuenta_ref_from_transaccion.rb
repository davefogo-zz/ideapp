class RemoveSubcuentaRefFromTransaccion < ActiveRecord::Migration
  def change
    remove_reference :transaccions, :subcuenta, index: true
    remove_foreign_key :transaccions, :subcuenta
  end
end
