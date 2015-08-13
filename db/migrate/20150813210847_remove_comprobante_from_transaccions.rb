class RemoveComprobanteFromTransaccions < ActiveRecord::Migration
  def change
    remove_column :transaccions, :comprobante, :integer
  end
end
