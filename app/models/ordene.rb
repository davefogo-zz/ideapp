class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  has_one :proveedore
end
