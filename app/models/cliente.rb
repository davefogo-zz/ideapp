class Cliente < ActiveRecord::Base
  belongs_to :colaboradore
  has_many :presupuestos
  validates :nombre, :nit, presence: true, uniqueness: true
  validates :nit, length: {is: 11} 
  
end
