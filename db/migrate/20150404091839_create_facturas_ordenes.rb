class CreateFacturasOrdenes < ActiveRecord::Migration
  def change
    create_table :facturas_ordenes do |t|
    	t.belongs_to :factura, index: true
    	t.belongs_to :ordene, index: true
    end
  end
end
