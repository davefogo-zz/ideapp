class Presupuesto < ActiveRecord::Base
  belongs_to :colaboradore
  has_many :ordenes
end
