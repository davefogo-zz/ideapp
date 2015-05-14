class AddUserRefToColaboradore < ActiveRecord::Migration
  def change
    add_reference :colaboradores, :user, index: true
    add_foreign_key :colaboradores, :users
  end
end
