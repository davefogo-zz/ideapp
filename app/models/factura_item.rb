class FacturaItem < ActiveRecord::Base
  
  belongs_to :factura
  belongs_to :ordene
  belongs_to :subcuenta_puc

  before_save :update_cuentas

  def update_cuentas
    self.subcuenta_puc_id = 1  if self.facturar == true
    self.subcuenta_puc_id = 2  if self.facturar_proveedor == true
    self.iva = 0  if self.sin_iva == true
  end

  def save
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.iva = (subtotal * 0.16)
    
    super   # calls the rails save function to store our object to the database
  end	

	
  after_save :generate_transaccion

  def generate_transaccion
  	Transaccion.create!(fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
    Transaccion.create!(fecha: Time.now, debito: self.iva)
  end
end
  