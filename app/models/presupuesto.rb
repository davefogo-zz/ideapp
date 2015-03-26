class Presupuesto < ActiveRecord::Base
  belongs_to :colaboradore
  has_many :ordenes
  has_many :proveedores, :through => :ordenes
  has_many :medios
end
