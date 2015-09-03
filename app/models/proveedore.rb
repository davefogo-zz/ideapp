class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy
  has_many :transaccions
  has_many :ajustes
  #validates :nombre, :nit, :telefono, :direccion, :contacto_financiero, :contacto_comercial, presence: true
  
  def self.search(search)
  	where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
  end

end
