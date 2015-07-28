class AddVariousToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :tipo_de_volumen, :string
    add_column :medios, :escala, :decimal
    add_column :medios, :rango, :string
    add_column :medios, :escala2, :decimal
    add_column :medios, :rango2, :string
    add_column :medios, :escala3, :decimal
    add_column :medios, :rango3, :string
    add_column :medios, :escala4, :decimal
    add_column :medios, :rango4, :string
    add_column :medios, :escala5, :decimal
    add_column :medios, :rango5, :string
    add_column :medios, :escala6, :decimal
    add_column :medios, :rango6, :string
    add_column :medios, :cobro, :string
  end
end
