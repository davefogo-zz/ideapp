class AddImporteMenosRetencionesToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :importe_menos_retenciones, :integer, :limit => 8
  end
end
