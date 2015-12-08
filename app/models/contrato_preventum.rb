class ContratoPreventum < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :proveedore
end
