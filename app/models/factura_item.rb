class FacturaItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :ordene
end
