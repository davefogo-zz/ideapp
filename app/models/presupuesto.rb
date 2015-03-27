class Presupuesto < ActiveRecord::Base
  belongs_to :cliente
  has_many :ordenes
  has_many :proveedores, :through => :ordenes
  has_many :medios
end
