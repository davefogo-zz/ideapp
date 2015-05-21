class Departamento < ActiveRecord::Base
  has_many :colaboradores
  has_many :cargos
end
