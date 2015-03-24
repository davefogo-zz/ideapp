class RemoveProveedoresFromMedios < ActiveRecord::Migration
  def change
    remove_reference :medios, :proveedore, index: true
    remove_foreign_key :medios, :proveedores
  end
end
