class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :medio
  has_one :factura_item
  validates :fecha_orden, :medida, :unidad, :costo_unidad, :total, :presupuesto_id, :medio_id, presence: true
end
