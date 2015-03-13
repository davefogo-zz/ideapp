class RemoveCupoDeCreditoFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :cupo_de_crédito, :string
  end
end
