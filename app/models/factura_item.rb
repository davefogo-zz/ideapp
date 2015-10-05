class FacturaItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :medio
  belongs_to :ordene
  belongs_to :subcuenta_puc
  has_many :incentivos
 

  before_save :calculate_total
  around_update :generate_transaccion_facturar_cliente, :if => :facturar?
  #running 1, 2 ,3 => before update,  4 => after_update OK
  before_update :generate_transaccion_facturar_proveedor, :if => :facturar_proveedor?
  after_update :generate_transaccion_incentivo_automatico, :if => :facturar?

  def calculate_total
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.iva = (subtotal * 0.16)
    self.total = subtotal + iva
  end

  def generate_transaccion_facturar_cliente
    #This callback creates a activo transaccions for the facturacion to a cliente.
    self.subcuenta_puc_id = 128 
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.total, subcuenta_puc_id: self.subcuenta_puc_id)
    # generate_transaccion_facturar_cliente_pasivo
    self.subcuenta_puc_id = 878
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
    #generate_transaccion_factura_cliente_iva
    self.subcuenta_puc_id = 880
    self.iva = 0  if self.sin_iva == true
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_facturar_proveedor
    if cobro_proveedor == 'Facturacion'
    #This callback creates an activo deudores transaccion for the facturacion to a proveedor for a incentivo.
      self.subcuenta_puc_id = 129
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
      #generate_transaccion_factura_proveedor_iva
      self.subcuenta_puc_id = 742
      #if self.sin_iva == true
        #self.iva = 0  
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
      #Tgenerate_transaccion_facturar_proveedor_ingreso_operacional, his callback creates an ingreso operacional transaccion for the facturacion to a proveedor for a incentivo.
      self.subcuenta_puc_id = 1232
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
  end
end

  def generate_transaccion_incentivo_automatico
    if ordene.medio.tipo_de_volumen == 'Automatico'
      #This callback creates an activo incentivos por cruzar
      self.subcuenta_puc_id = 130
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.ordene.incentivo, subcuenta_puc_id: self.subcuenta_puc_id)
      #This callback creates an ingreso operacional cruce, :generate_transaccion_incentivo_automatico_ingreso_operacional 
      self.subcuenta_puc_id = 1233
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.ordene.incentivo, subcuenta_puc_id: self.subcuenta_puc_id)
    end  
  end
end