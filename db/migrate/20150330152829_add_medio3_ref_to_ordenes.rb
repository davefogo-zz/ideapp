class AddMedio3RefToOrdenes < ActiveRecord::Migration
  def change
    add_reference :ordenes, :medio, index: true
    add_foreign_key :ordenes, :medios
  end
end
