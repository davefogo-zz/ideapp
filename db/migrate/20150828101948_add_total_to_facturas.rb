class AddTotalToFacturas < ActiveRecord::Migration
  def change
    add_column :facturas, :total, :integer, :limit => 8
  end
end
