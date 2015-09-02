class RemoveDescrpicionFromTransaccions < ActiveRecord::Migration
  def change
    remove_column :transaccions, :descripcion, :string
  end
end
