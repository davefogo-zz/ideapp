class Colaboradore < ActiveRecord::Base
  has_many :presupuestos
  has_many :clientes, :through => :presupuestos
end
