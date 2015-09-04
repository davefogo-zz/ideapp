class RemoveSubcuentaRefFromReciboItem < ActiveRecord::Migration
  def change
    remove_reference :recibo_items, :subucenta_puc, index: true
    remove_foreign_key :recibo_items, :subucenta_pucs
    remove_reference :recibo_items, :subcuenta_puc_id, index: true
    remove_foreign_key :recibo_items, :subcuenta_puc_ids
  end
end
