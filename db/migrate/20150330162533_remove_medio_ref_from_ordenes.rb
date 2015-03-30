class RemoveMedioRefFromOrdenes < ActiveRecord::Migration
  def change
    remove_reference :ordenes, :medio, index: true
    remove_foreign_key :ordenes, :medios
  end
end
