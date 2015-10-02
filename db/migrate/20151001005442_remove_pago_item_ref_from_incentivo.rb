class RemovePagoItemRefFromIncentivo < ActiveRecord::Migration
  def change
    remove_reference :incentivos, :pago_item, index: true
    remove_foreign_key :incentivos, :pago_items
  end
end
