class FacturaItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :medio
  belongs_to :ordene
  belongs_to :subcuenta_puc
  has_many :incentivos
 

  before_update :calculate_total, :generate_transaccion_facturar_cliente_activo, 
  :generate_transaccion_facturar_cliente_pasivo, :generate_transaccion_factura_cliente_iva, 
  :generate_transaccion_facturar_proveedor_activo, :generate_transaccion_factura_proveedor_iva, 
  :generate_transaccion_facturar_proveedor_ingreso_operacional,  
  :generate_transaccion_incentivo_automatico_activo,
  :generate_transaccion_incentivo_automatico_ingreso_operacional 

  def calculate_total
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.iva = (subtotal * 0.16)
    self.total = subtotal + iva
  end

  def generate_transaccion_facturar_cliente_activo
    #This callback creates a activo transaccions for the facturacion to a cliente.
    self.subcuenta_puc_id = 128 if self.facturar == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_facturar_cliente_pasivo
    #This callback creates a pasivo ingresos terceros
    self.subcuenta_puc_id = 878  if self.facturar == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_factura_cliente_iva
    self.subcuenta_puc_id = 880 if self.facturar == true
    self.iva = 0  if self.sin_iva == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_facturar_proveedor_activo
    #This callback creates an activo deudores transaccion for the facturacion to a proveedor for a incentivo.
    self.subcuenta_puc_id = 129 if self.facturar_proveedor == true && self.cobro_proveedor == 'Facturacion'
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_factura_proveedor_iva
    self.subcuenta_puc_id = 742 if self.facturar_proveedor == true && self.cobro_proveedor == 'Facturacion'
    self.iva = 0  if self.sin_iva == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_facturar_proveedor_ingreso_operacional
    #This callback creates an ingreso operacional transaccion for the facturacion to a proveedor for a incentivo.
    self.subcuenta_puc_id = 1232  if self.facturar_proveedor == true && self.cobro_proveedor == 'Facturacion'
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_incentivo_automatico_activo
    #This callback creates an activo incentivos por cruzar
    self.subcuenta_puc_id = 130 if self.ordene.medio.tipo_de_volumen == 'Automatico' && self.cobro_proveedor == 'Cruce'
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.ordene.incentivo, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_incentivo_automatico_ingreso_operacional
    #This callback creates an ingreso operacional cruce
    self.subcuenta_puc_id = 1233 if self.ordene.medio.tipo_de_volumen == 'Automatico' && self.cobro_proveedor == 'Cruce'
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.ordene.incentivo, subcuenta_puc_id: self.subcuenta_puc_id)
  end
end