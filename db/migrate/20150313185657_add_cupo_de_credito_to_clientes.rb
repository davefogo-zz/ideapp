class AddCupoDeCreditoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :cupo_de_credito, :string
  end
end
