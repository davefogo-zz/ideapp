class AddTipoDeMedioToMedio < ActiveRecord::Migration
  def change
    add_column :medios, :tipo_de_medio, :string
  end
end
