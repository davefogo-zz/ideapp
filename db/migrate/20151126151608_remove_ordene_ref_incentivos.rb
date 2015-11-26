class RemoveOrdeneRefIncentivos < ActiveRecord::Migration
  def change
  	remove_reference :incentivos, :ordene, index: true
  end
end
