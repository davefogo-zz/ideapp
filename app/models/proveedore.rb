class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy 
  has_many :ordenes
end
