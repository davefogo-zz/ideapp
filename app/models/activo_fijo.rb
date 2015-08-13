class ActivoFijo < ActiveRecord::Base
  belongs_to :gasto
  belongs_to :subcuenta_puc
end
