class FacturaProveedor < ActiveRecord::Base
  belongs_to :ordene
  belongs_to :proveedore
  before_save :generate_iva_calculation, :generate_pronto_pago_calculation, :generate_fecha_vencimiento_calculation

  def generate_iva_calculation
  	self.iva = self.importe * 0.16
  end

  def generate_pronto_pago_calculation
  	self.pronto_pago = self.proveedore.pronto_pago * self.importe
  end

  def generate_fecha_vencimiento_calculation
  	self.fecha_vencimiento = (self.fecha_recepcion + 60.days) if self.pronto_pago.nil?
  	self.fecha_vencimiento = (self.fecha_recepcion + 30.days) if self.dias_pronto_pago == 30
  	self.fecha_vencimiento = (self.fecha_recepcion + 15.days) if self.dias_pronto_pago == 15
  end

  after_save :generate_transaccion_proveedor_is, :generate_transaccion_proveedor_bs, :generate_transaccion_iva_is, :generate_transaccion_iva_is

  def generate_transaccion_proveedor_is
  	self.subcuenta_puc_id = 6
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_proveedor_bs
  	self.subcuenta_puc_id = 5
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_iva_is
  	self.subcuenta_puc_id = 6
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_iva_bs
  	self.subcuenta_puc_id = 5
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

end
