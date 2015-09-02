class AddDescrpicionToAjustes < ActiveRecord::Migration
  def change
    add_column :ajustes, :descripcion, :string
  end
end
