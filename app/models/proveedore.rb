class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy
  validates :nombre, :nit, :telefono, :direccion, :contacto_financiero, :contacto_comercial, presence: true
  
  def self.search(search)
  	where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
  end

end
