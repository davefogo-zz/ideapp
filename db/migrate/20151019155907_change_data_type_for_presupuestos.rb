class ChangeDataTypeForPresupuestos < ActiveRecord::Migration
	def up
		change_column :presupuestos, :fecha, :date
	end

	def down
		change_column :presupuestos, :fecha, :datetime
	end
end
