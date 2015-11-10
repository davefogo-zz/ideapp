class FacturaProveedor < ActiveRecord::Base
  belongs_to :ordene
  belongs_to :pago
  belongs_to :pago_item
  belongs_to :proveedore
  before_save :generate_iva_calculation, :generate_pronto_pago_calculation,
   :generate_fecha_vencimiento_calculation

  def generate_iva_calculation
  	self.iva = self.importe * 0.16
  end

  def generate_pronto_pago_calculation
  	self.importe_pronto_pago = self.proveedore.pronto_pago * self.importe
  end

  def generate_fecha_vencimiento_calculation
    self.fecha_recepcion = Time.now
  	self.fecha_vencimiento = (self.fecha_recepcion + 60.days) if self.importe_pronto_pago == 0
    self.fecha_vencimiento = (self.fecha_recepcion + 45.days) if self.proveedore.dias_pronto_pago == 45
  	self.fecha_vencimiento = (self.fecha_recepcion + 30.days) if self.proveedore.dias_pronto_pago == 30
  	self.fecha_vencimiento = (self.fecha_recepcion + 15.days) if self.proveedore.dias_pronto_pago == 15
  end

  after_save :generate_transaccion_proveedor_pasivo, :generate_transaccion_proveedor_intermediacion_pasivo, 
  :generate_transaccion_intermediacion_iva_pasivo #:generate_transaccion_importe_pronto_pago

  def generate_transaccion_proveedor_pasivo
    self.total = importe + iva
  	self.subcuenta_puc_id = 667
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, credito: self.total, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_proveedor_intermediacion_pasivo
  	self.subcuenta_puc_id = 878
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def generate_transaccion_intermediacion_iva_pasivo
  	self.subcuenta_puc_id = 880
  	Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.iva, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  #def generate_transaccion_importe_pronto_pago
   # self.subcuenta_puc_id = 4210
    #Transaccion.create!(factura_proveedor_id: self.id, fecha: Time.now, debito: self.importe_pronto_pago, subcuenta_puc_id: self.subcuenta_puc_id)
  #end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      FacturaProveedor.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |factura_proveedore|
        csv << factura_proveedor.attributes.values_at(*column_names)
      end
    end
  end

end
