class AddOrdeneRefToOrdenItems < ActiveRecord::Migration
  def change
    add_reference :orden_items, :ordene, index: true
    add_foreign_key :orden_items, :ordenes
  end
end
