class FacturaItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :medio
  belongs_to :ordene
  belongs_to :subcuenta_puc
 

  before_update :generate_transaccion_ingreso,  :generate_transaccion_iva, :generate_transaccion_volumen, :calculate_total

  def calculate_total
    self.total = subtotal + iva
  end

  def generate_transaccion_ingreso
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.subcuenta_puc_id = 1  if self.facturar == true
    self.subcuenta_puc_id = 2  if self.facturar_proveedor == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_iva
    self.iva = (subtotal * 0.16)
    self.iva = 0  if self.sin_iva == true
    self.subcuenta_puc_id = 3
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_volumen
    self.subcuenta_puc_id = 5 if self.medio.tipo_de_volumen == 'Automatico' && self.medio.cobro == 'Cruce'
    self.subcuenta_puc_id = 6 if self.medio.tipo_de_volumen == 'Automatico' && self.medio.cobro == 'Facturacion' 
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.valor, subcuenta_puc_id: self.subcuenta_puc_id)
    FacturaItem.create!(fecha_orden: self.fecha_orden, subtotal: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id, medio_id: self.medio_id, ordene_id: self.ordene_id)
  end
end 

