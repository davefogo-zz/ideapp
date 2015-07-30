class FacturaItem < ActiveRecord::Base
  
  before_update :generate_transaccion_one,  :generate_transaccion_two

  def generate_transaccion_one
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.subcuenta_puc_id = 1  if self.facturar == true
    self.subcuenta_puc_id = 2  if self.facturar_proveedor == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_two
    self.iva = (subtotal * 0.16)
    self.iva = 0  if self.sin_iva == true
    self.subcuenta_puc_id = 3
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end


  belongs_to :factura
  belongs_to :ordene
  belongs_to :subcuenta_puc

 
end
  