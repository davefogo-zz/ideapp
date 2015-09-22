class RemoveEscalasFromEscalas < ActiveRecord::Migration
  def change
    remove_column :escalas, :escala2, :decimal
    remove_column :escalas, :escala3, :decimal
    remove_column :escalas, :escala4, :decimal
    remove_column :escalas, :escala5, :decimal
  end
end
