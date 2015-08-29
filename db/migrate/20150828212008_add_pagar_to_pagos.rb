class AddPagarToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :pagar, :boolean
  end
end
