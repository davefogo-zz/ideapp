class AddOrdeneRefToMedios < ActiveRecord::Migration
  def change
    add_reference :medios, :ordene, index: true
    add_foreign_key :medios, :ordenes
  end
end
