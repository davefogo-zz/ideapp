class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :proveedore
end
