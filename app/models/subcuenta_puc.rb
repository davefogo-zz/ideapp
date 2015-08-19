class SubcuentaPuc < ActiveRecord::Base
  belongs_to :CuentaPuc
  
	def self.search(search)
		 where("subcuenta LIKE ? OR descripcion LIKE ?", "%#{search}%", "%#{search}%")
	end
end
