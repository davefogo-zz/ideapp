class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :proveedore
  has_many :medios, through: :presupuestos
end
