class RemoveNmeroDeCuentaFromReciboDeCajas < ActiveRecord::Migration
  def change
    remove_column :recibo_de_cajas, :numero_de_cuenta, :integer
  end
end
