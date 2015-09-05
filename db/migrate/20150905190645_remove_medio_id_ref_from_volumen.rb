class RemoveMedioIdRefFromVolumen < ActiveRecord::Migration
  def change
    remove_reference :volumen, :medio_id, index: true
    remove_foreign_key :volumen, :medio_ids
  end
end
