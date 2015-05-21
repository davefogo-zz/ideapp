class Colaboradore < ActiveRecord::Base
  belongs_to :user
  belongs_to :departamento
  belongs_to :cargo
  has_many :clientes
  validates :cedula, presence: true
end
