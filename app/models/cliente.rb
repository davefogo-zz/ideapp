class Cliente < ActiveRecord::Base
  belongs_to :colaboradore
  has_many :presupuestos
  has_many :facturas
  validates :nombre, :nit, presence: true, uniqueness: true
  validates :nit, length: {is: 11} 

  def self.search(search)
  	where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
  end
end
