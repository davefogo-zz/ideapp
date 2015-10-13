class CreateIncentivos < ActiveRecord::Migration
  def change
    create_table :incentivos do |t|
      t.string :tipo_de_volumen
      t.string :cobro
      t.references :medio, index: true
      t.integer :valor_incnetivo, :limit => 8
      t.references :ordene, index: true
      t.references :pago, index: true

      t.timestamps null: false
    end
    add_foreign_key :incentivos, :medios
    add_foreign_key :incentivos, :ordenes
    add_foreign_key :incentivos, :pagos
  end
end
