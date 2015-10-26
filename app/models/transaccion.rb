class Transaccion < ActiveRecord::Base
  belongs_to :subcuenta_puc
  belongs_to :cliente
  belongs_to :proveedore
  belongs_to :ajuste

  total_debito = Transaccion.sum(:debito)

  def self.to_csv
	CSV.generate do |csv|
		csv << column_names
		all.each do |transaccion|
			csv << transaccion.attributes.values_at(*column_names)
		end
	end
  end
end
