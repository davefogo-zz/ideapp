class AddVariousRefToTransaccions < ActiveRecord::Migration
  def change
    add_reference :transaccions, :pago, index: true
    add_foreign_key :transaccions, :pagos
    add_reference :transaccions, :recibo_de_caja, index: true
    add_foreign_key :transaccions, :recibo_de_cajas
    add_reference :transaccions, :gasto, index: true
    add_foreign_key :transaccions, :gastos
    add_reference :transaccions, :factura_proveedor, index: true
    add_foreign_key :transaccions, :factura_proveedors
  end
end
