class RemoveContactoFinancieroFromPresupuestos < ActiveRecord::Migration
  def change
    remove_column :presupuestos, :contacto_financiero, :string
  end
end
