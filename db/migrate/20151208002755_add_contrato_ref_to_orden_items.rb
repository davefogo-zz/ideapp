class AddContratoRefToOrdenItems < ActiveRecord::Migration
  def change
    add_reference :orden_items, :contrato, index: true
    add_foreign_key :orden_items, :contratos
  end
end
