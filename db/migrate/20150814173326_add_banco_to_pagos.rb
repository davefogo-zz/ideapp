class AddBancoToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :banco, :string
  end
end
