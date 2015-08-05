class Volumen < ActiveRecord::Base
  belongs_to :medio
  belongs_to :factura_item
end
