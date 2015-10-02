class RemoveVarious5FromIncentivos < ActiveRecord::Migration
  def change
    remove_reference :incentivos, :factura, index: true
    remove_foreign_key :incentivos, :facturas
    remove_reference :incentivos, :factura_item, index: true
    remove_foreign_key :incentivos, :factura_items
  end
end
