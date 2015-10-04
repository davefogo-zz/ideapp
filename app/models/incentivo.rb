class Incentivo < ActiveRecord::Base
  belongs_to :medio
  belongs_to :ordene
  belongs_to :factura
  belongs_to :factura_item
  belongs_to :pago
end
