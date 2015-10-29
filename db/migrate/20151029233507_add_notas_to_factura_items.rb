class AddNotasToFacturaItems < ActiveRecord::Migration
  def change
    add_column :factura_items, :notas, :string
  end
end
