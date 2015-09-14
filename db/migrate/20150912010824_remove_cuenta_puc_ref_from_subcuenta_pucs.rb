class RemoveCuentaPucRefFromSubcuentaPucs < ActiveRecord::Migration
  def change
    remove_reference :subcuenta_pucs, :cuenta_puc, index: true
    remove_foreign_key :subcuenta_pucs, :cuenta_pucs
  end
end
