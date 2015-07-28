class RemoveVariousFromVolumen < ActiveRecord::Migration
  def change
    remove_reference :volumen, :medio_id, index: true
    remove_foreign_key :volumen, :medio_ids
    remove_reference :volumen, :factura_id, index: true
    remove_foreign_key :volumen, :factura_ids
  end
end
