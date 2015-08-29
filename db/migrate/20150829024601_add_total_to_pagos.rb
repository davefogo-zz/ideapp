class AddTotalToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :total, :integer, :limit => 8
  end
end

