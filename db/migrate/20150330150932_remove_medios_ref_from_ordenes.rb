class RemoveMediosRefFromOrdenes < ActiveRecord::Migration
  def change
    remove_reference :ordenes, :medios, index: true
    remove_foreign_key :ordenes, :medios
  end
end
