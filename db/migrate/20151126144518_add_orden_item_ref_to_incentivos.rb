class AddOrdenItemRefToIncentivos < ActiveRecord::Migration
  def change
    add_reference :incentivos, :orden_item, index: true
    add_foreign_key :incentivos, :orden_items
  end
end
