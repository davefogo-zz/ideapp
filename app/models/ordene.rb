class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :medio
  has_one :factura_item, dependent: :destroy
  has_many :incentivos, dependent: :destroy
  validates :fecha_orden, :unidad, :costo_unidad, :presupuesto_id, :medio_id, :cantidad, :descuento, presence: true
  before_save :calculate_iva, :calculate_subtotal, :calculate_incentivo, :calculate_total
  after_save :generate_factura_item, :if => :aprobado_por_cliente?
  before_destroy :generate_ordene_anulada

    def calculate_iva
      self.iva = (costo_unidad * 0.16)
    end

    def calculate_subtotal
      self.subtotal = ((costo_unidad * cantidad) - (costo_unidad * descuento))
    end
    
    def calculate_total
      self.total = subtotal + iva
    end

    def calculate_incentivo
      self.incentivo = ((costo_unidad * cantidad) - (costo_unidad * descuento)) * self.medio.escala.escala
    end
    
    def aprobado_por_cliente?
    	if aprobado_por_cliente == true
        true
        else 
          false
      end
    end

    def generate_factura_item
      if self.facturado.blank?
      	FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: self.fecha_orden, unidad: self.unidad, costo_unidad: self.costo_unidad, cantidad: self.cantidad, medio_id: self.medio_id, ordene_id: self.id, descuento: self.descuento, presupuesto_id: self.presupuesto_id)
        if self.medio.cobro == 'Facturacion'
          self.cantidad = 1
          self.descuento = 0
          FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: self.fecha_orden, ordene_id: self.id, presupuesto_id: self.presupuesto_id, cobro_proveedor: self.medio.cobro, cantidad: self.cantidad, medio_id: self.medio_id, costo_unidad: self.incentivo , descuento: self.descuento)
        self.facturado = Time.now
        end
      end
    end

    def generate_incentivo
      Incentivo.create!(valor_incentivo: self.incentivo, medio_id: self.medio_id, ordene_id: self.id, tipo_de_volumen: self.medio.tipo_de_volumen, cobro: self.medio.cobro)
    end

    def generate_ordene_anulada
      OrdenAnulada.create!(fecha_orden: self.fecha_orden, orden_reemplazada: self.id, unidad: self.unidad, costo_unidad: self.costo_unidad, presupuesto: self.presupuesto_id, cantidad: self.cantidad, descuento: self.descuento, iva: self.iva, total: self.total)
    end
end
