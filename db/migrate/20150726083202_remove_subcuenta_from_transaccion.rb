class RemoveSubcuentaFromTransaccion < ActiveRecord::Migration
  def change
    remove_column :transaccions, :subcuenta, :integer
  end
end
