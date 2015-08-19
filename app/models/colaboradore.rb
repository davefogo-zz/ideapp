class Colaboradore < ActiveRecord::Base
  belongs_to :user
  belongs_to :departamento
  belongs_to :cargo
  has_many :clientes
  validates :cedula, presence: true
	def self.search(search)
		where("nombre LIKE ? OR cedula LIKE ?", "%#{search}%", "%#{search}%")
	end
end
