class Cargo < ActiveRecord::Base
  belongs_to :departamento
  has_many :colaboradores
end
