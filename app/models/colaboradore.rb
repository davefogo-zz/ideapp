class Colaboradore < ActiveRecord::Base
  has_many :clientes
  has_many :presupuestos
end
