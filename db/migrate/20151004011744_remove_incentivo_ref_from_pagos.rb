class RemoveIncentivoRefFromPagos < ActiveRecord::Migration
  def change
    remove_reference :pagos, :incentivo, index: true
    remove_foreign_key :pagos, :incentivos
  end
end
