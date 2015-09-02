class Ajuste < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :proveedore
  has_many :transaccions
end
