class Factura < ActiveRecord::Base
   has_many :factura_items
   has_many :recibo_items
   belongs_to :cliente
   belongs_to :presupuesto
   validates :fecha_de_expedicion, presence: true
   before_save :calculate_fecha_de_vencimiento
   before_update :subtotal, :iva, :total 

   def calculate_fecha_de_vencimiento
   	self.fecha_de_vencimiento = (self.fecha_de_expedicion + 30.days)
   end

   def subtotal
    self.factura_items.sum(:subtotal)
   end

   def iva
    self.factura_items.sum(:iva)
   end

   def total
    self.factura_items.sum(:total)
   end
end
