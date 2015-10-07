class RemoveTipoDeClienteFromCliente < ActiveRecord::Migration
  def change
    remove_column :clientes, :tipo_de_cliente, :string
  end
end
