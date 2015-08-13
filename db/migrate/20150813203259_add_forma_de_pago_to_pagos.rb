class AddFormaDePagoToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :forma_de_pago, :string
  end
end
