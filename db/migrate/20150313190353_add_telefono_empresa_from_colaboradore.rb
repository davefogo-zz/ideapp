class AddTelefonoEmpresaFromColaboradore < ActiveRecord::Migration
  def change
    add_column :colaboradores, :telefono_empresa, :string
  end
end
