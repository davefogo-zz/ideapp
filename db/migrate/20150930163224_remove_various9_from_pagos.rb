class RemoveVarious9FromPagos < ActiveRecord::Migration
  def change
    remove_column :pagos, :forma_de_pago, :string
    remove_reference :pagos, :subcuenta_puc, index: true
    remove_foreign_key :pagos, :subcuenta_pucs
  end
end
