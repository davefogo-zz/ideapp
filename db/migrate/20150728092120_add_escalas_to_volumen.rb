class AddEscalasToVolumen < ActiveRecord::Migration
  def change
    add_column :volumen, :escala2, :decimal
    add_column :volumen, :escala3, :decimal
    add_column :volumen, :escala4, :decimal
    add_column :volumen, :escala5, :decimal
    add_column :volumen, :escala6, :decimal
  end
end
