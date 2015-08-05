class RemoveVariousFromVolumen < ActiveRecord::Migration
  def change
    remove_column :volumen, :escala2, :string
    remove_column :volumen, :escala3, :string
    remove_column :volumen, :escala4, :string
    remove_column :volumen, :escala5, :string
    remove_column :volumen, :escala6, :string
    remove_column :volumen, :rango2, :string
    remove_column :volumen, :rango2, :string
    remove_column :volumen, :rango3, :string
    remove_column :volumen, :rango4, :string
    remove_column :volumen, :rango5, :string
    remove_column :volumen, :rango6, :string
  end
end
