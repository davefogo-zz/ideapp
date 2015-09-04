class Cliente < ActiveRecord::Base
  belongs_to :colaboradore
  belongs_to :user
  has_many :presupuestos
  has_many :facturas
  has_many :recibo_de_cajas
  has_many :transaccions
  has_many :ajustes
  validates :nombre, :nit, presence: true, uniqueness: true
  validates :nit, length: {is: 11} 

  def self.search(search)
  	where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
  end
end
