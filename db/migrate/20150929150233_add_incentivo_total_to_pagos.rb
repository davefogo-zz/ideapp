class AddIncentivoTotalToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :incentivo_total, :integer, :limit => 8
  end
end
