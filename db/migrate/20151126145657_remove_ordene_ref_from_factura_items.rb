class RemoveOrdeneRefFromFacturaItems < ActiveRecord::Migration
  def change
    remove_reference :factura_items, :ordene, index: true

  end
end
