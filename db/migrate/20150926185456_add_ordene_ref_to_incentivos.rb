class AddOrdeneRefToIncentivos < ActiveRecord::Migration
  def change
    add_reference :incentivos, :ordene, index: true
    add_foreign_key :incentivos, :ordenes
  end
end
