class AddPorcentajeProntoPagoToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :porcentaje_pronto_pago, :decimal
  end
end
