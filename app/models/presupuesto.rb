class Presupuesto < ActiveRecord::Base
  belongs_to :colaboradore
  has_many :ordenes, dependent: :destroy
  has_many :proveedores, :through => :ordenes
end
