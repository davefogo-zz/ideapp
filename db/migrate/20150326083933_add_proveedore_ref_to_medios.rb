class AddProveedoreRefToMedios < ActiveRecord::Migration
  def change
    add_reference :medios, :proveedore, index: true
    add_foreign_key :medios, :proveedores
  end
end
