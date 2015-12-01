class AddImporteOrdenManualToOrdenItems < ActiveRecord::Migration
  def change
    add_column :orden_items, :importe_orden_manual, :integer, :limit => 8
  end
end
