class AddVariousToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :ciudad, :string
    add_column :clientes, :codigo_postal, :string
    add_column :clientes, :pais, :string
  end
end
