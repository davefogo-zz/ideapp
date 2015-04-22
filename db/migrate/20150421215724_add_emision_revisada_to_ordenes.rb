class AddEmisionRevisadaToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :emision_certificada, :integer
  end
end
