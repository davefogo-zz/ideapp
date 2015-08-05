class AddValorVolumenToVolumen < ActiveRecord::Migration
  def change
    add_column :volumen, :valor_volumen, :integer, :limit => 8
  end
end
