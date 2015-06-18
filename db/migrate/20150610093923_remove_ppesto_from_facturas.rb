class RemovePpestoFromFacturas < ActiveRecord::Migration
  def change
    remove_reference :facturas, :presupesto, index: true
    remove_foreign_key :facturas, :presupestos
  end
end
