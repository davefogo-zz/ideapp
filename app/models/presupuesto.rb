class Presupuesto < ActiveRecord::Base
  belongs_to :cliente
  has_many :ordenes, dependent: :destroy
  accepts_nested_attributes_for :ordenes
  has_many :medios, :through => :ordenes
  has_one :factura
  validates :fecha, :titulo, :cliente_id, :producto, presence: true

end
