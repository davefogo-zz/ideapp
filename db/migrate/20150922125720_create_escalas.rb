class CreateEscalas < ActiveRecord::Migration
  def change
    create_table :escalas do |t|
      t.decimal :escala
      t.decimal :escala2
      t.decimal :escala3
      t.decimal :escala4
      t.decimal :escala5

      t.timestamps null: false
    end
  end
end
