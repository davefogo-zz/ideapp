class RemoveIncentivoFromPagoItem < ActiveRecord::Migration
  def change
    remove_column :pago_items, :incentivo, :integer
  end
end
