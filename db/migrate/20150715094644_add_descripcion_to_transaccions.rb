class AddDescripcionToTransaccions < ActiveRecord::Migration
  def change
    add_column :transaccions, :descripcion, :string
  end
end
