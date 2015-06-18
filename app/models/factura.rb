class Factura < ActiveRecord::Base
   has_many :factura_items
   belongs_to :cliente
   belongs_to :presupuesto
   validates :fecha_de_expedicion, presence: true
end
