class AddIvaToMedios < ActiveRecord::Migration
  def change
    add_column :medios, :iva, :integer
  end
end
