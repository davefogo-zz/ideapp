class Presupuesto < ActiveRecord::Base
  belongs_to :cliente
  has_many :ordenes, dependent: :destroy
  has_many :medios, :through => :ordenes
end
