class RemoveEscalasFromMedios < ActiveRecord::Migration
  def change
    remove_column :medios, :escala, :decimal
    remove_column :medios, :rango, :string
    remove_column :medios, :escala2, :decimal
    remove_column :medios, :rango2, :string
    remove_column :medios, :escala3, :decimal
    remove_column :medios, :rango3, :string
    remove_column :medios, :escala4, :decimal
    remove_column :medios, :rango4, :string
    remove_column :medios, :escala5, :decimal
    remove_column :medios, :rango5, :string
    remove_column :medios, :escala6, :decimal
    remove_column :medios, :rango6, :string
  end
end
