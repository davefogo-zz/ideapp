class Contrato < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :proveedore
  has_many :orden_items

  before_save :calculate_total
  after_initialize :calculate_saldo

	def calculate_total
		self.total = self.monto + self.iva
	end

	def calculate_saldo
		if saldo.nil?
			self.saldo = self.total
			else
				self.saldo = self.total - self.orden_items.sum(:total)
		end
		
	end
end
