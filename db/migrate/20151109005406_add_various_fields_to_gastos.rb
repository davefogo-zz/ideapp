class AddVariousFieldsToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :ret_fte, :decimal
    add_column :gastos, :ret_ica, :decimal
    add_column :gastos, :iva_teo, :boolean
    add_column :gastos, :importe_fte, :integer, :limit => 8
    add_column :gastos, :importe_ica, :integer, :limit => 8
    add_column :gastos, :importe_iva_teo, :integer, :limit => 8
  end
end
