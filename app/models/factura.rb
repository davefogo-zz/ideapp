class Factura < ActiveRecord::Base
   has_many :ordenes
end
