class Presupuesto < ActiveRecord::Base
  belongs_to :cliente
  has_many :ordenes
end
