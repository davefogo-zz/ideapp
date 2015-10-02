class AddSubtotalToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :subtotal, :integer, :limit => 8
  end
end
