class AddCargoRefToColaboradore < ActiveRecord::Migration
  def change
    add_reference :colaboradores, :cargo, index: true
    add_foreign_key :colaboradores, :cargos
  end
end
