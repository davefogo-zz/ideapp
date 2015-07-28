class RemoveFacturaItemIdFromVolumen < ActiveRecord::Migration
  def change
    remove_reference :volumen, :factura_item_id, index: true
    remove_foreign_key :volumen, :factura_item_ids
  end
end
