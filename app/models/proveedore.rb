class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy 
  has_many :ordenes
  has_many :presupuestos, :through => :ordenes
end
