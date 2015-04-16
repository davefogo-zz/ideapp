class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy
  validates :nombre, :nit, :telefono, :ireccion, :contacto_financiero, :contacto_comercial, presence: true
end
