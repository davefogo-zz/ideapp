class RemoveVarious8FromPagos < ActiveRecord::Migration
  def change
    remove_column :pagos, :importe, :integer
    remove_column :pagos, :form_de_pago, :string
    remove_column :pagos, :banco, :string
    remove_column :pagos, :numero_de_cheque, :string
  end
end
