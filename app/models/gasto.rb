class Gasto < ActiveRecord::Base
	belongs_to :proveedore
	belongs_to :autorizado_por
	belongs_to :subcuenta_puc
	belongs_to :cliente
	belongs_to :colaboradore
	belongs_to :user
	has_many :pago_items

	before_save :transaccion_proveedor_gasto, :activo, :retenciones,  
	:transaccion_iva_descontable_gasto 

	after_save :transaccion_gasto_proveedor_por_pagar_pasivo
	def transaccion_proveedor_gasto
		Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
	end

	def activo
		if compra_de_activo == true
			ActivoFijo.create!(fecha_de_compra: self.fecha_recepcion, gasto_id: self.id, importe: self.importe)
		end
	end

	def retenciones
		self.importe_fte =0
		self.importe_ica =0
		self.importe_ret_iva =0
		self.importe_iva_teo =0
		unless self.ret_fte == 0
			self.importe_fte = importe * ret_fte
			self.subcuenta_puc_id = 715
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe_fte, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		unless self.ret_ica == 0
			self.importe_ica = importe * ret_ica
			self.subcuenta_puc_id = 719
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe_ica, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		if self.ret_iva == true
			self.importe_ret_iva = iva * 0.15
			self.subcuenta_puc_id = 717
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe_ret_iva, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		if self.iva_teo == true
			self.importe_iva_teo = iva * 0.15
			self.subcuenta_puc_id = 1716
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe_iva_teo, subcuenta_puc_id: self.subcuenta_puc_id)
		end
		self.importe_menos_retenciones = (importe - importe_fte - importe_ica - importe_iva_teo - importe_ret_iva + iva)
	end

	def transaccion_iva_descontable_gasto
		self.subcuenta_puc_id = 742
		Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
	end

	def transaccion_gasto_proveedor_por_pagar_pasivo
		if self.gasto_pago == false
			self.importe_fte =0
			self.importe_ica =0
			self.importe_iva_teo =0
			unless self.ret_fte == 0
				self.importe_fte = importe * ret_fte
			end
			unless self.ret_ica == 0
				self.importe_ica = importe * ret_ica
			end
			if self.ret_iva == true
				self.importe_ret_iva = iva * 0.15
			end
			if self.iva_teo == true
				self.importe_iva_teo = iva * 0.15
			end
			self.subcuenta_puc_id = 669 if self.gasto_pago == false
			Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe_menos_retenciones, subcuenta_puc_id: self.subcuenta_puc_id)
		end
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	Colaboradore.create! row.to_hash
	  end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |gasto|
				csv << gasto.attributes.values_at(*column_names)
			end
		end
	end
end
