class AddTotalToFacturaProveedors < ActiveRecord::Migration
  def change
    add_column :factura_proveedors, :total, :integer, :limit => 8
  end
end
