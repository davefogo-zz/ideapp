class AddCobroProveedorToFacturaItem < ActiveRecord::Migration
  def change
    add_column :factura_items, :cobro_proveedor, :string
  end
end
