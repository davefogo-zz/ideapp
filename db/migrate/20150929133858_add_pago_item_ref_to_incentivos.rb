class AddPagoItemRefToIncentivos < ActiveRecord::Migration
  def change
    add_reference :incentivos, :pago_item, index: true
    add_foreign_key :incentivos, :pago_items
  end
end
