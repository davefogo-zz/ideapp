class AddSubotalToPagoItem < ActiveRecord::Migration
  def change
    add_column :pago_items, :subtotal, :integer, :limit => 8
  end
end
