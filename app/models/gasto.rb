class Gasto < ActiveRecord::Base
	belongs_to :proveedore
	belongs_to :autorizado_por
	belongs_to :subcuenta_puc
	belongs_to :cliente
	belongs_to :colaboradore
	belongs_to :user
	belongs_to :pago

	
	after_save :activo, :transaccion_gasto_proveedor_bs, :transaccion_gasto_proveedor_is, :transaccion_gasto_iva_bs, :transaccion_gasto_iva_is
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
			self.subcuenta_puc_id = 2
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		def transaccion_gasto_iva_is
			self.subcuenta_puc_id = 5
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
	end
end
