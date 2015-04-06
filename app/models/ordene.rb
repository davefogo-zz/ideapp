class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :medio
  has_many :facturas, :through => :facturas_ordenes
end
