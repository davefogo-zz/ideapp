class Factura < ActiveRecord::Base
   has_many :factura_items
end
