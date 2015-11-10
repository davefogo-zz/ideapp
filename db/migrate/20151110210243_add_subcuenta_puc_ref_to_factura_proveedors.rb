class AddSubcuentaPucRefToFacturaProveedors < ActiveRecord::Migration
  def change
    add_reference :factura_proveedors, :subcuenta_puc, index: true
    add_foreign_key :factura_proveedors, :subcuenta_pucs
  end
end
