class Gasto < ActiveRecord::Base
	belongs_to :proveedore
	belongs_to :autorizado_por
	belongs_to :subcuenta_puc
	belongs_to :cliente

	after_save :calculate_fecha_vencimiento, :transaccion_proveedor_bs, :transaccion_proveedor_is, :transaccion_iva_bs, :transaccion_iva_is
		def calculate_fecha_vencimiento
			self.fecha_de_vencimiento = Time.now + 60.days
		end
		def transaccion_proveedor_bs
			Transaccion.create!(comprobante: self.id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_proveedor_is
			self.subcuenta_puc_id = 4
			Transaccion.create!(comprobante: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_iva_bs
			self.iva = (importe * 0.16)
			self.subcuenta_puc_id = 2
			Transaccion.create!(comprobante: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_iva_is
			self.subcuenta_puc_id = 5
			Transaccion.create!(comprobante: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
end
