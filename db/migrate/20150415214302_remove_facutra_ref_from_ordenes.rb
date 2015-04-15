class RemoveFacutraRefFromOrdenes < ActiveRecord::Migration
  def change
    remove_reference :ordenes, :facutra, index: true
    remove_foreign_key :ordenes, :facutras
  end
end
