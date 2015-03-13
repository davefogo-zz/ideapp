class RemoveContactoComercialFromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :contacto_comercial, :string
  end
end
