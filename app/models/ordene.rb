class Ordene < ActiveRecord::Base
  before_save :calculate_subtotal

    def calculate_subtotal
      self.subtotal = ((costo_unidad * cantidad) - (costo_unidad * descuento)) * self.medio.escala
    end

  after_save :generate_factura_item, :generate_volumen, :if => :aprobado_por_cliente?
    
    def aprobado_por_cliente?
    	if aprobado_por_cliente == 1
        true
        else 
          false
      end
    end

    def generate_factura_item
    	FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: Time.now, unidad: self.unidad, costo_unidad: self.costo_unidad, cantidad: self.cantidad, medio_id: self.id, ordene_id: self.id, descuento: self.descuento, presupuesto_id: self.presupuesto_id)
    end

    def generate_volumen
      Volumen.create!(valor_volumen: self.subtotal, medio_id: self.medio_id, ordene_id: self.id)
    end

  belongs_to :presupuesto
  belongs_to :medio
  has_one :factura_item
  validates :fecha_orden, :unidad, :costo_unidad, :presupuesto_id, :medio_id, presence: true
end
