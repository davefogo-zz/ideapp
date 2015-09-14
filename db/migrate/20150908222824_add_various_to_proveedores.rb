class AddVariousToProveedores < ActiveRecord::Migration
  def change
    add_column :proveedores, :tipo_de_documento, :string
    add_column :proveedores, :tipo_de_responsable, :string
    add_column :proveedores, :tipo_de_persona, :string
    add_column :proveedores, :tipo_de_retencion_iva, :string
    add_column :proveedores, :tipo_de_retencion_ica, :string
  end
end
