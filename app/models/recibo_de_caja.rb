class ReciboDeCaja < ActiveRecord::Base
  belongs_to :factura
  after_save :generate_transaccion_recibo_is, :generate_transaccion_recibo_bs

  def :generate_transaccion_recibo_is
  	self.subcuenta_puc_id = 6  if self.forma_de_pago == 'Transferencia'
  	self.subcuenta_puc_id = 7  if self.forma_de_pago == 'Cheque'
  	self.subcuenta_puc_id = 8  if self.forma_de_pago == 'Efectivo'
    Transaccion.create!(comprobante: self.id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def :generate_transaccion_recibo_bs
  	self.subcuenta_puc_id = 6  if self.forma_de_pago == 'Transferencia'
  	self.subcuenta_puc_id = 7  if self.forma_de_pago == 'Cheque'
  	self.subcuenta_puc_id = 8  if self.forma_de_pago == 'Efectivo'
    Transaccion.create!(comprobante: self.id, fecha: Time.now, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id).id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

end
