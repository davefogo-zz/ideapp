class AddEscalaRefToProveedores < ActiveRecord::Migration
  def change
    add_reference :proveedores, :escala, index: true
    add_foreign_key :proveedores, :escalas
  end
end
