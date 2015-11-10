class PagoItem < ActiveRecord::Base
  belongs_to :pago
  belongs_to :factura_proveedor
  belongs_to :subcuenta_puc

  
  before_save :transaccion_pago_proveedor, :transaccion_pago_proveedor, :calculo_importe_pronto_pago
  after_save  :transaccion_pago_gasto, :if => :gasto?

  def calculo_importe_pronto_pago
    if self.factura_proveedor.fecha_vencimiento > Time.now 
      self.importe_pronto_pago = self.factura_proveedor.importe_pronto_pago
    else
      0
    end
  end

  def transaccion_pago_gasto
    self.gastos.sum(:importe)
    self.subcuenta_puc_id = 692
    Transaccion.create!(pago_id: self.pago.id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def transaccion_pago_proveedor
    self.subcuenta_puc_id = 1 if  forma_de_pago =='Efectivo'
    self.subcuenta_puc_id = 5 if  banco =='Banco de Bogota Corriente 8414'
  	self.subcuenta_puc_id = 6 if  banco =='Bancolombia Corriente 6464'
  	self.subcuenta_puc_id = 7 if  banco =='Citibank Corriente 0035'
    Transaccion.create!(pago_id: self.pago.id, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
    self.subcuenta_puc_id = 667
    Transaccion.create!(pago_id: self.pago.id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id) 
  end
end
