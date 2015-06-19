class RemoveRevisadoFromFacturaItems < ActiveRecord::Migration
  def change
    remove_column :factura_items, :revisado, :integer
  end
end
