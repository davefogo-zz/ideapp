class Factura < ActiveRecord::Base
	has_many :ordenes, :through => :facturas_ordenes
end
