class RemoveClaseRefFromSubcuentaPucs < ActiveRecord::Migration
  def change
    remove_reference :subcuenta_pucs, :clase, index: true
    remove_foreign_key :subcuenta_pucs, :clases
  end
end
