class AddSubcuentaRefToReciboItem < ActiveRecord::Migration
  def change
    add_reference :recibo_items, :subcuenta_puc, index: true
    add_foreign_key :recibo_items, :subcuenta_pucs
  end
end
