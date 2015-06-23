class AddCoberturaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :cobertura, :string
  end
end
