class AddCuentaRefToSubcuentaPucs < ActiveRecord::Migration
  def change
    add_reference :subcuenta_pucs, :cuenta_puc, index: true
    add_foreign_key :subcuenta_pucs, :cuenta_pucs
  end
end
