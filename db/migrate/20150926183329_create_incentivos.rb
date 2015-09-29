class CreateIncentivos < ActiveRecord::Migration
  def change
    create_table :incentivos do |t|
      t.string :tipo_de_volumen
      t.string :cobro
      t.references :medio, index: true
      t.references :factura, index: true
      t.references :factura_item, index: true
      t.references :pago, index: true

      t.timestamps null: false
    end
    add_foreign_key :incentivos, :medios
    add_foreign_key :incentivos, :facturas
    add_foreign_key :incentivos, :factura_items
    add_foreign_key :incentivos, :pagos
  end
end
