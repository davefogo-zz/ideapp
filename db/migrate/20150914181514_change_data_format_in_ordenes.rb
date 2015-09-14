class ChangeDataFormatInOrdenes < ActiveRecord::Migration
	def up
		change_column :ordenes, :fecha_orden, :date
	end
	def down
		change_column :ordenes, :fecha_orden, :datetime
	end
end
