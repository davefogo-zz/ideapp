class Medio < ActiveRecord::Base
  belongs_to :proveedore
  has_many :ordenes, through: :presupuestos
end
