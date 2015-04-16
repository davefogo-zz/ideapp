class Medio < ActiveRecord::Base
  belongs_to :proveedore
  has_many :ordenes, dependent: :destroy
  has_many :presupuestos, :through => :ordenes
  validates :proveedore_id, :nombre, :nit, presence: true
  validates :nit, length: {is: 11}
end
