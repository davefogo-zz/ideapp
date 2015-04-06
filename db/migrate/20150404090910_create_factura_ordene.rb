class CreateFacturaOrdene < ActiveRecord::Migration
  def change
    create_table :factura_ordenes do |t|
    	t.belongs_to :assembly, index: true
     	t.belongs_to :part, index: true
    end
  end
end
