class RemoveValorFromVolumen < ActiveRecord::Migration
  def change
    remove_column :volumen, :valor, :integer
  end
end
