class OrdenItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :medio
  belongs_to :ordene
  belongs_to :contrato
  has_many :incentivos, dependent: :destroy
  validates :fecha_item, :costo_unidad, :medio_id, :cantidad, :descuento, presence: true

  before_save :calculate_area, :calculate_subtotal, :calculate_iva, :calculate_importe_descuento,  :calculate_incentivo, :calculate_total
  after_save :generate_factura_item, :if => :aprobado_por_cliente?
  before_destroy :generate_orden_anulada

    def calculate_area
      self.area = (cm * col)
    end

   def calculate_iva
      self.iva = (subtotal * 0.16)
    end

    def calculate_importe_descuento
      self.importe_descuento = subtotal * descuento
    end

    def calculate_subtotal
      if area == 0
        self.subtotal = costo_unidad * cantidad
        else
        self.subtotal = area * costo_unidad * cantidad
      end
    end

    def calculate_total
      self.total = subtotal - importe_descuento + iva
    end

    def calculate_incentivo
      if area == 0
        self.incentivo = ((costo_unidad * cantidad) - importe_descuento) * self.medio.escala.escala
        else
        self.incentivo = ((area * cantidad) - importe_descuento) * self.medio.escala.escala
      end
    end

    def generate_factura_item
      if self.facturado.blank?
        if self.orden_manual.blank?
      	 FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: self.fecha_item, costo_unidad: self.costo_unidad, cantidad: self.cantidad, medio_id: self.medio_id, orden_item_id: self.id, descuento: self.descuento, presupuesto_id: self.ordene.presupuesto_id, notas: self.notas)
          if self.medio.cobro == 'FACTURAR'
            elsif self.medio.cobro == 'FACTURAR & CRUZAR'
            self.cantidad = 1
            self.descuento = 0
            FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: self.fecha_item, orden_item_id: self.id, presupuesto_id: self.ordene.presupuesto_id, cobro_proveedor: self.medio.cobro, cantidad: self.cantidad, medio_id: self.medio_id, costo_unidad: self.incentivo , descuento: self.descuento)
            self.facturado = Time.now
          end
         else
          self.cantidad = 1
          FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: self.fecha_item, costo_unidad: self.importe_orden_manual, cantidad: self.cantidad, medio_id: self.medio_id, orden_item_id: self.id, descuento: self.descuento, presupuesto_id: self.ordene.presupuesto_id, notas: self.notas)
          if self.medio.cobro == 'FACTURAR'
            elsif self.medio.cobro == 'FACTURAR & CRUZAR'
            self.cantidad = 1
            self.descuento = 0
            FacturaItem.create!(ubicacion: self.ubicacion, fecha_orden: self.fecha_item, orden_item_id: self.id, presupuesto_id: self.ordene.presupuesto_id, cobro_proveedor: self.medio.cobro, cantidad: self.cantidad, medio_id: self.medio_id, costo_unidad: self.incentivo , descuento: self.descuento)
            self.facturado = Time.now
          end
        end
      end
    end

    def generate_incentivo
      Incentivo.create!(valor_incentivo: self.incentivo, medio_id: self.medio_id, orden_item_id: self.id, tipo_de_volumen: self.medio.tipo_de_volumen, cobro: self.medio.cobro)
    end

    def generate_orden_anulada
      OrdenAnulada.create!(fecha_orden: self.fecha_item, orden_reemplazada: self.id, costo_unidad: self.costo_unidad, presupuesto: self.presupuesto_id, cantidad: self.cantidad, descuento: self.descuento, iva: self.iva, total: self.total)
    end
end
