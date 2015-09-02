class AddAjusteRefToTransaccions < ActiveRecord::Migration
  def change
    add_reference :transaccions, :ajuste, index: true
    add_foreign_key :transaccions, :ajustes
  end
end
