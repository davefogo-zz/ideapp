class AddProveedoreIdRefToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :proveedore_id, index: true
    add_foreign_key :ordenes, :proveedore_ids
  end
end
