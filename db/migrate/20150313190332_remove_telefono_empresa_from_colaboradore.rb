class RemoveTelefonoEmpresaFromColaboradore < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :teléfono_empresa, :string
  end
end
