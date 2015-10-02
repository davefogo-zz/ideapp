class AddIncentivoToPagoItem < ActiveRecord::Migration
  def change
    add_column :pago_items, :incentivo, :integer, :limit => 8
  end
end
