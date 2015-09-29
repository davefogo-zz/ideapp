class Gasto < ActiveRecord::Base
	belongs_to :proveedore
	belongs_to :autorizado_por
	belongs_to :subcuenta_puc
	belongs_to :cliente
	belongs_to :colaboradore
	belongs_to :user
	belongs_to :pago

	
	after_save :activo,:transaccion_proveedor_gasto, 
	:transaccion_iva_descontable_gasto, :transaccion_gasto_proveedor_por_pagar_pasivo, 
	:transaccion_gasto_iva_por_pagar_pasivo 


	def activo
		if compra_de_activo == true
			ActivoFijo.create!(fecha_de_compra: self.fecha_recepcion, gasto_id: self.id, importe: self.importe)
		end
	end

	def transaccion_proveedor_gasto
		Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
	end

	def transaccion_iva_descontable_gasto
		self.subcuenta_puc_id = 1716
		Transaccion.create!(gasto_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
	end

	def transaccion_gasto_proveedor_por_pagar_pasivo
		self.subcuenta_puc_id = 693 if self.pago == false
		Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
	end

	def transaccion_gasto_iva_por_pagar_pasivo
		self.subcuenta_puc_id = 742 if self.pago == false
		Transaccion.create!(gasto_id: self.id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
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
