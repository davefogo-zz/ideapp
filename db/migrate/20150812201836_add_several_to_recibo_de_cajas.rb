class AddSeveralToReciboDeCajas < ActiveRecord::Migration
  def change
    add_column :recibo_de_cajas, :codigo_de_banco, :integer
    add_column :recibo_de_cajas, :numero_de_cheque, :integer
    add_column :recibo_de_cajas, :numero_de_cuenta, :integer
  end
end
