class AddBancoToReciboItem < ActiveRecord::Migration
  def change
    add_column :recibo_items, :banco, :string
  end
end
