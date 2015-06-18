class Ordene < ActiveRecord::Base
after_save :generate_factura_item, :if => :aprobado_por_cliente?
  
  def aprobado_por_cliente?
  	if aprobado_por_cliente = 1
      true
      else 
        false
    end
  end

  def generate_factura_item
  	FacturaItem.create!(fecha_orden: Time.now, medida: self.medida, unidad: self.unidad, costo_unidad: self.costo_unidad, total: self.total, medio_id: self.medio_id, ordene_id: self.id)
  end

  belongs_to :presupuesto
  belongs_to :medio
  has_one :factura_item
  validates :fecha_orden, :medida, :unidad, :costo_unidad, :total, :presupuesto_id, :medio_id, presence: true
end
