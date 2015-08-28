class Pago < ActiveRecord::Base
  belongs_to :proveedore
  belongs_to :factura_proveedor
  belongs_to :subcuenta_puc
  belongs_to :gasto

  after_save :gasto_o_proveedor, :transaccion_pago_credito

  def gasto_o_proveedor
	  if gasto == true 
	  	:transaccion_pago_debito_gasto
	  else 
	  	:transaccion_pago_debito_proveedor
	  end
  end

  def transaccion_pago_debito_proveedor
  	self.subcuenta_puc_id = 1105 if  banco =='Banco de Bogota Corriente 8414'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, factura_proveedor_id: self.factura_proveedor_id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1110 if  banco =='Bancolombia Corriente 6464'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha,factura_proveedor_id: self.factura_proveedor_id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1115 if  banco =='Citibank Corriente 0035'
  end

  def transaccion_pago_debito_gasto
  	self.subcuenta_puc_id = 1105 if  banco =='Banco de Bogota Corriente 8414'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, gasto_id: self.gasto_id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1110 if  banco =='Bancolombia Corriente 6464'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, gasto_id: self.gasto_id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1115 if  banco =='Citibank Corriente 0035'
  end

  def transaccion_pago_credito
  	self.subcuenta_puc_id = 2205
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, factura_proveedor_id: self.factura_proveedor_id, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

end
