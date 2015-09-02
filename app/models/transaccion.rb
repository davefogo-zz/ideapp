class Transaccion < ActiveRecord::Base
  belongs_to :subcuenta_puc
  belongs_to :cliente
  belongs_to :proveedore
  belongs_to :ajuste
end
