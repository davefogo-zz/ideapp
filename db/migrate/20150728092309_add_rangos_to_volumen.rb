class AddRangosToVolumen < ActiveRecord::Migration
  def change
    add_column :volumen, :rango2, :string
    add_column :volumen, :rango3, :string
    add_column :volumen, :rango4, :string
    add_column :volumen, :rango5, :string
    add_column :volumen, :rango6, :string
  end
end
