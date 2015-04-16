class Factura < ActiveRecord::Base
   has_many :factura_items
   validates :fecha_de_expedicion, presence: true
end
