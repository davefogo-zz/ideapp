class AddTipoDeRetencionIcaToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :tipo_de_retencion_ica, :decimal
  end
end
