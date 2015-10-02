class AddPagoRefToIncentivos < ActiveRecord::Migration
  def change
    add_reference :incentivos, :pago, index: true
    add_foreign_key :incentivos, :pagos
  end
end
