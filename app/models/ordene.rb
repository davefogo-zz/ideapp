class Ordene < ActiveRecord::Base
  belongs_to :presupuesto
  belongs_to :medio
  has_one :factura_item
end
