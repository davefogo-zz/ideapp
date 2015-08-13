class AddImporteToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :importe, :integer, :limit => 8
  end
end
