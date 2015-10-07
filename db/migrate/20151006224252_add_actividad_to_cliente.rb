class AddActividadToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :actividad, :string
  end
end
