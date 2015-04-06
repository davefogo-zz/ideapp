class CreateFacturaOrdeneTable < ActiveRecord::Migration
  def change
    create_table :factura_ordene_tables, id: false do |t|
    	t.belongs_to :factura, index: true
     	t.belongs_to :ordene, index: true
    end
  end
end
