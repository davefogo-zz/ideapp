class Colaboradore < ActiveRecord::Base
  belongs_to :user
  has_many :clientes
  validates :cedula, :nombre, presence: true
end
