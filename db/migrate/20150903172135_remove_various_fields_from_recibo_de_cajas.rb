class RemoveVariousFieldsFromReciboDeCajas < ActiveRecord::Migration
  def change
    remove_reference :recibo_de_cajas, :factura, index: true
    remove_foreign_key :recibo_de_cajas, :facturas
    remove_column :recibo_de_cajas, :forma_de_pago, :string
    remove_column :recibo_de_cajas, :numero_de_cheque, :integer
    remove_column :recibo_de_cajas, :nmero_de_cuenta, :integer
    remove_column :recibo_de_cajas, :codigo_de_banco, :integer
    remove_reference :recibo_de_cajas, :subcuenta_puc, index: true
    remove_foreign_key :recibo_de_cajas, :subcuenta_pucs
    remove_column :recibo_de_cajas, :concepto, :string
    remove_column :recibo_de_cajas, :importe, :integer
  end
end
