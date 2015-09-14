class AddVarious2ToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :tipo_de_documento, :string
    add_column :clientes, :tipo_de_persona, :string
    add_column :clientes, :tipo_de_responsable, :string
  end
end
