class RemoveSubtotalFromPagoItems < ActiveRecord::Migration
  def change
    remove_column :pago_items, :subtotal, :integer
  end
end
