class RemoveCuentaPucRefFromSubcuentaPuc < ActiveRecord::Migration
  def change
    remove_reference :subcuenta_pucs, :CuentaPuc, index: true
    remove_foreign_key :subcuenta_pucs, :CuentaPucs
  end
end
