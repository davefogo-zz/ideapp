class Volumen < ActiveRecord::Base
  belongs_to :medio_id
  belongs_to :factura_item_id
end
