class Factura < ActiveRecord::Base
   has_many :factura_items
   belongs_to :cliente
   belongs_to :presupuesto
   validates :fecha_de_expedicion, presence: true
   before_save :calculate_fecha_de_vencimiento

   def calculate_fecha_de_vencimiento
   	self.fecha_de_vencimiento = (self.fecha_de_expedicion + 30.days)
   end

end
