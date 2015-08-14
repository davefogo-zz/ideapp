class AddNumeroDeChequeToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :numero_de_cheque, :integer
  end
end
