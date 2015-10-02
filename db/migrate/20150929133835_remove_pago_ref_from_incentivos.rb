class RemovePagoRefFromIncentivos < ActiveRecord::Migration
  def change
    remove_reference :incentivos, :pago, index: true
    remove_foreign_key :incentivos, :pagos
  end
end
