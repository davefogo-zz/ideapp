class AddVarious2ToSubcuentaPucs < ActiveRecord::Migration
  def change
    add_column :subcuenta_pucs, :rubro, :string
    add_column :subcuenta_pucs, :tipo_de_cuenta, :string
    add_column :subcuenta_pucs, :moneda, :string
  end
end
