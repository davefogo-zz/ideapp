class AddOrdenManualToOrdenItems < ActiveRecord::Migration
  def change
    add_column :orden_items, :orden_manual, :boolean
  end
end
