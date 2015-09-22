class FacturaItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :medio
  belongs_to :ordene
  belongs_to :subcuenta_puc
 

  before_update :calculate_total, :generate_transaccion_facturar_cliente_activo, :generate_transaccion_facturar_cliente_pasivo, :generate_transaccion_facturar_proveedor_activo, :generate_transaccion_facturar_proveedor_ingreso_operacional,  :generate_transaccion_iva, :generate_transaccion_volumen, 

  def calculate_total
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.total = subtotal + iva
  end

  def generate_transaccion_facturar_cliente_activo
    #This callback creates a activo transaccions for the facturacion to a cliente.
    self.subcuenta_puc_id = 13050505 if self.facturar && factura_item_id.not_blank? == true 
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_facturar_cliente_pasivo
    self.subcuenta_puc_id = 281505  if self.facturar == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end
  
  def generate_transaccion_facturar_proveedor_activo
    #This callback creates an activo transaccion for the facturacion to a proveedor for a incentivo.
    self.subcuenta_puc_id = 13050510  if self.facturar_proveedor == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

   def generate_transaccion_facturar_proveedor_ingreso_operacional
    #This callback creates an ingreso transaccion for the facturacion to a proveedor for a incentivo.
    self.subcuenta_puc_id = 4155558  if self.facturar_proveedor == true
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
    #FacturaItem.create!(fecha_orden: self.fecha_orden, subtotal: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id, medio_id: self.medio_id, ordene_id: self.ordene_id)
  end
end