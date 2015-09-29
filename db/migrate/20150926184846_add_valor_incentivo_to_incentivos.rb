class AddValorIncentivoToIncentivos < ActiveRecord::Migration
  def change
    add_column :incentivos, :valor_incentivo, :integer, :limit => 8
  end
end