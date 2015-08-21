class SubcuentaPuc < ActiveRecord::Base
  belongs_to :CuentaPuc
  has_many :transaccions
  
	def self.search(search)
		 where("subcuenta LIKE ? OR descripcion LIKE ?", "%#{search}%", "%#{search}%")
	end
end
