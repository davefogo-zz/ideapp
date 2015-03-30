class Medio < ActiveRecord::Base
  belongs_to :proveedore
  has_many :ordenes
  has_many :presupuestos, :through => :ordenes
end
