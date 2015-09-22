class AddEscalaRefToMedios < ActiveRecord::Migration
  def change
    add_reference :medios, :escala, index: true
    add_foreign_key :medios, :escalas
  end
end
