class AddFormatoToOrdenes < ActiveRecord::Migration
  def change
    add_column :ordenes, :formato, :string
  end
end
