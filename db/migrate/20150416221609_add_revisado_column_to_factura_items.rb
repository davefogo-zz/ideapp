class AddRevisadoColumnToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :revisado, :integer
  end
end
