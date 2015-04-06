class CreateFacturaOrdenes < ActiveRecord::Migration
  def change
    create_table :factura_ordenes do |t|

      t.timestamps null: false
    end
  end
end
