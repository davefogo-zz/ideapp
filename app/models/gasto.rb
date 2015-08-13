class Gasto < ActiveRecord::Base
  belongs_to :proveedore
  belongs_to :autorizado_por
  belongs_to :subcuenta_puc
  belongs_to :cliente
end
