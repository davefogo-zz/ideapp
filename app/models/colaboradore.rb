class Colaboradore < ActiveRecord::Base
  has_many :clientes
  validates :cedula, :nombre, :presence true
end
