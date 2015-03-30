class AddMedio2RefToOrdene < ActiveRecord::Migration
  def change
    add_reference :ordenes, :medio, index: true
    add_foreign_key :ordenes, :medio
  end
end
