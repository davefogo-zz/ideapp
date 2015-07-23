class AddNitToTransaccions < ActiveRecord::Migration
  def change
    add_column :transaccions, :nit, :string
  end
end
