class AddProntoPagosToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :pronto_pago, :decimal
    add_column :proveedores, :dias_pronto_pago, :integer
  end
end
