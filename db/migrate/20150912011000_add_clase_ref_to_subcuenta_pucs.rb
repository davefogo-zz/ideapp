class AddClaseRefToSubcuentaPucs < ActiveRecord::Migration
  def change
    add_reference :subcuenta_pucs, :clase, index: true
    add_foreign_key :subcuenta_pucs, :clases
  end
end
