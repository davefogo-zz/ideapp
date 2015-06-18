class RemovePresupestoRefFromFacturas < ActiveRecord::Migration
  def change
    remove_reference :facturas, :presupesto_id, index: true
    remove_foreign_key :facturas, :presupesto_ids
  end
end
