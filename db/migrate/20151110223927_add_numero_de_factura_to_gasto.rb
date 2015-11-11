class AddNumeroDeFacturaToGasto < ActiveRecord::Migration
  def change
    add_column :gastos, :numero_de_factura, :string
  end
end
