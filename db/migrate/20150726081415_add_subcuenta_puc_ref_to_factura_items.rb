class AddSubcuentaPucRefToFacturaItems < ActiveRecord::Migration
  def change
    add_reference :factura_items, :subcuenta_puc, index: true
    add_foreign_key :factura_items, :subcuenta_pucs
  end
end
