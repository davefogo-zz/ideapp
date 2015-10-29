class ReciboItem < ActiveRecord::Base
  belongs_to :recibo_de_caja
  belongs_to :factura
  belongs_to :subcuenta_puc

  after_save :generate_transaccion_recibo_item_debito_activo, :generate_transaccion_recibo_item_credito_activo
	  def generate_transaccion_recibo_item_debito_activo
	  	self.subcuenta_puc_id = 5  if forma_de_pago == 'Transferencia' && banco =='Banco de Bogota Corriente 8414'
	  	self.subcuenta_puc_id = 6  if forma_de_pago == 'Transferencia' && banco =='Bancolombia Corriente 6464'
	  	self.subcuenta_puc_id = 7 if forma_de_pago == 'Transferencia' && banco =='Citibank Corriente 0035'	
	  	self.subcuenta_puc_id = 5 if forma_de_pago == 'Cheque' && banco =='Banco de Bogota Corriente 8414'
	  	self.subcuenta_puc_id = 6 if forma_de_pago == 'Cheque' && banco =='Bancolombia Corriente 6464'
	  	self.subcuenta_puc_id = 7 if forma_de_pago == 'Cheque' && banco =='Citibank Corriente 0035'
	  	self.subcuenta_puc_id = 1  if forma_de_pago == 'Efectivo'
	    Transaccion.create!(recibo_de_caja_id: self.recibo_de_caja_id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
	  end

	  def generate_transaccion_recibo_item_credito_activo
	  	self.subcuenta_puc_id = 127
	    Transaccion.create!(recibo_de_caja_id: self.recibo_de_caja_id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
	  end
end
