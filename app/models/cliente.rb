class Cliente < ActiveRecord::Base
  belongs_to :colaboradore
  has_many :presupuestos
end
