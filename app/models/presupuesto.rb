class Presupuesto < ActiveRecord::Base
  belongs_to :cliente
  has_many :ordenes, dependent: :destroy
  has_many :medios, :through => :ordenes
  validates :fecha, :titulo, :cliente_id :producto presence: true
end
