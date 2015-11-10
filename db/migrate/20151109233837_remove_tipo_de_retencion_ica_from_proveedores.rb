class RemoveTipoDeRetencionIcaFromProveedores < ActiveRecord::Migration
  def change
    remove_column :proveedores, :tipo_de_retencion_ica, :string
  end
end
