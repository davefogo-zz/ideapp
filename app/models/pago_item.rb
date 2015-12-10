class PagoItem < ActiveRecord::Base
  belongs_to :pago
  has_many :factura_proveedor
  belongs_to :subcuenta_puc
  belongs_to :gasto

  
  before_save :transaccion_pago_proveedor, :transaccion_pago_proveedor, :calculo_importe_pronto_pago
  after_save  :transaccion_pago_gasto, :if => :gasto_id?

  def calculo_importe_pronto_pago
    unless self.gasto == nil
      if self.factura_proveedor.fecha_vencimiento > Time.now 
        self.importe_pronto_pago = self.factura_proveedor.importe_pronto_pago
      else
        0
      end
    end
  end

  def transaccion_pago_gasto
    self.subcuenta_puc_id = 1 if  forma_de_pago =='Efectivo'
    self.subcuenta_puc_id = 5 if  banco =='Banco de Bogota Corriente 8414'
    self.subcuenta_puc_id = 6 if  banco =='Bancolombia Corriente 6464'
    self.subcuenta_puc_id = 7 if  banco =='Citibank Corriente 0035'
    Transaccion.create!(pago_id: self.pago.id, fecha: self.pago.fecha, credito: self.gasto.importe_menos_retenciones, subcuenta_puc_id: self.subcuenta_puc_id, numero_de_documento: self.proveedore.numero_de_documento)
    self.subcuenta_puc_id = 692
    Transaccion.create!(pago_id: self.pago.id, fecha: self.pago.fecha, debito: self.gasto.importe_menos_retenciones, subcuenta_puc_id: self.subcuenta_puc_id, numero_de_documento: self.proveedore.numero_de_documento)
  end

  def transaccion_pago_proveedor
    self.subcuenta_puc_id = 1 if  forma_de_pago =='Efectivo'
    self.subcuenta_puc_id = 5 if  banco =='Banco de Bogota Corriente 8414'
  	self.subcuenta_puc_id = 6 if  banco =='Bancolombia Corriente 6464'
  	self.subcuenta_puc_id = 7 if  banco =='Citibank Corriente 0035'
    Transaccion.create!(pago_id: self.pago.id, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id, numero_de_documento: self.proveedore.numero_de_documento)
    self.subcuenta_puc_id = 667
    Transaccion.create!(pago_id: self.pago.id, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id, numero_de_documento: self.proveedore.numero_de_documento) 
  end
end
