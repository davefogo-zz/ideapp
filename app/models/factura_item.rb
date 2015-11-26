class FacturaItem < ActiveRecord::Base
  belongs_to :factura
  belongs_to :medio
  belongs_to :orden_item
  belongs_to :subcuenta_puc
  has_many :incentivos
 

  before_save :calculate_total
  before_update :generate_transaccion_facturar_proveedor, :calculate_ret, :if => :facturar_proveedor?
  #around_update :generate_transaccion_facturar_cliente, :if => :facturar?
  #running 1, 2 ,3 => before update,  4 => after_update OK
  after_update :generate_transaccion_facturar_cliente, :generate_transaccion_incentivo_automatico, :if => :facturar?

  def calculate_total
    ret_fte = 0
    ret_ica = 0
    ret_iva = 0 
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento)
    self.iva = (subtotal * 0.16)
  end

  def generate_transaccion_facturar_proveedor
    if cobro_proveedor == 'FACTURAR' or 'FACTURAR & CRUZAR'
    #This callback creates an activo deudores transaccion for the facturacion to a proveedor for a incentivo.
      self.subcuenta_puc_id = 129
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
      #generate_transaccion_factura_proveedor_iva
      #if self.sin_iva == true
        #self.iva = 0  
      self.subcuenta_puc_id = 742
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
      #Tgenerate_transaccion_facturar_proveedor_ingreso_operacional, his callback creates an ingreso operacional transaccion for the facturacion to a proveedor for a incentivo.
      
      #if orden_item.cliente.tipo_de_persona = 'GRAN CONTRIBUYENTE AUTORRETENEDOR'
      #end
    end
  end

  def calculate_ret
    self.ret_fte = (subtotal * 0.011)
    self.subcuenta_puc_id = 188
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.ret_fte, subcuenta_puc_id: self.subcuenta_puc_id)
    self.ret_ica = (subtotal * medio.proveedore.tipo_de_retencion_ica)
    self.subcuenta_puc_id = 187
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.ret_ica, subcuenta_puc_id: self.subcuenta_puc_id)
    self.ret_iva = (iva * 0.15)
    self.subcuenta_puc_id = 189
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.ret_iva, subcuenta_puc_id: self.subcuenta_puc_id)
    self.total = subtotal + iva - ret_fte - ret_ica - ret_iva
    self.subcuenta_puc_id = 129
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.total, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_facturar_cliente
    self.total = subtotal + iva
    #Clientes nacionales 1305
    self.subcuenta_puc_id = 127 
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.total, subcuenta_puc_id: self.subcuenta_puc_id)
    #ingresos para terceros 281505
    self.subcuenta_puc_id = 880 
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
    #iva ingresos terceros 28150501
    self.subcuenta_puc_id = 878 
    Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.subtotal, subcuenta_puc_id: self.subcuenta_puc_id)
    # generate_transaccion_facturar_cliente_pasivo
    #generate_transaccion_factura_cliente_iva
    #self.subcuenta_puc_id = 880
    #self.iva = 0 
    #if self.sin_iva == true
    #Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_incentivo_automatico
    if medio.cobro == 'CRUZAR'
      #This callback creates an activo incentivos por cruzar
      self.subcuenta_puc_id = 130
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, debito: self.orden_item.incentivo, subcuenta_puc_id: self.subcuenta_puc_id)
      #This callback creates an ingreso operacional cruce, :generate_transaccion_incentivo_automatico_ingreso_operacional 
      self.subcuenta_puc_id = 1231
      Transaccion.create!(factura_item_id: self.id, fecha: Time.now, credito: self.orden_item.incentivo, subcuenta_puc_id: self.subcuenta_puc_id)
    end  
  end
end