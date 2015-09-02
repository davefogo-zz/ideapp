class AddProveedoreRefToTransaccion < ActiveRecord::Migration
  def change
    add_reference :transaccions, :proveedore, index: true
    add_foreign_key :transaccions, :proveedores
  end
end
