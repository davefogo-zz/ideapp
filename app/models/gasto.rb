class Gasto < ActiveRecord::Base
	belongs_to :proveedore
	belongs_to :autorizado_por
	belongs_to :subcuenta_puc
	belongs_to :cliente

	before_save :calculate_fecha_vencimiento
		def calculate_fecha_vencimiento
			self.fecha_de_vencimiento = Time.now + 60.days
		end
	after_save :activo, :calculate_fecha_vencimiento, :transaccion_gasto_proveedor_bs, :transaccion_gasto_proveedor_is, :transaccion_gasto_iva_bs, :transaccion_gasto_iva_is
		def activo
			if compra_de_activo == true
			ActivoFijo.create!(fecha_de_compra: self.fecha_recepcion, gasto_id: self.id, importe: self.importe)
		end
		def transaccion_gasto_proveedor_bs
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_gasto_proveedor_is
			self.subcuenta_puc_id = 4
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_gasto_iva_bs
			self.iva = (importe * 0.16)
			self.subcuenta_puc_id = 2
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_gasto_iva_is
			self.subcuenta_puc_id = 5
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
	end
end
