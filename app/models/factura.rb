class Factura < ActiveRecord::Base
   has_many :items_factura
end
