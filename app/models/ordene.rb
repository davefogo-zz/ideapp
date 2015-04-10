class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :medio
  belongs_to :factura
end
