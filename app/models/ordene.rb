class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :medio
  has_one :factura_item
  validates :fecha_orden, :unidad, :costo_unidad, :presupuesto_id, :medio_id, presence: true
  before_save :calculate_iva, :calculate_subtotal, :calculate_total
  after_save :generate_factura_item, :generate_volumen, :if => :aprobado_por_cliente?

    def calculate_iva
      self.iva = (costo_unidad * 0.16)
    end

    def calculate_subtotal
      self.subtotal = ((costo_unidad * cantidad) - (costo_unidad * descuento)) * self.medio.escala
    end
    
    def calculate_total
      self.total = subtotal + iva
    end
    
    def aprobado_por_cliente?
    	if aprobado_por_cliente == true
        true
        else 
          false
      end
    end

    def generate_factura_item
    	FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: Time.now, unidad: self.unidad, costo_unidad: self.costo_unidad, cantidad: self.cantidad, medio_id: self.medio_id, ordene_id: self.id, descuento: self.descuento, presupuesto_id: self.presupuesto_id)
    end

    def generate_volumen
      Volumen.create!(valor_volumen: self.subtotal, medio_id: self.medio_id, ordene_id: self.id)
    end

  
end
