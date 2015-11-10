class RemoveValorIncnetivoFromIncentivos < ActiveRecord::Migration
  def change
    remove_column :incentivos, :valor_incnetivo, :integer
  end
end
