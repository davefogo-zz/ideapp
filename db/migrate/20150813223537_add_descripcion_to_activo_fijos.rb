class AddDescripcionToActivoFijos < ActiveRecord::Migration
  def change
    add_column :activo_fijos, :descripcion, :string
  end
end
