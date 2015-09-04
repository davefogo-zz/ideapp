class Pago < ActiveRecord::Base
  belongs_to :proveedore
  has_many :factura_proveedors
  belongs_to :subcuenta_puc
  has_many :gastos

  before_update :gasto_o_proveedor, :importe_proveedor, :calculo_importe_pronto_pago
  after_update :calculo_total, :transaccion_pago_credito

  def gasto_o_proveedor
	  if gasto == true 
	  	:transaccion_pago_debito_gasto
      :importe_proveedor
	  else 
	  	:transaccion_pago_debito_proveedor
      :importe_gasto
	  end
  end

  def importe_proveedor
    self.factura_proveedors.sum(:importe)
  end

  def calculo_importe_pronto_pago
    self.factura_proveedors.sum(:importe_pronto_pago)
  end

 def calculo_total
    self.total = importe - importe_pronto_pago 
  end

  def importe_gasto
    self.gastos.sum(:importe)
  end

  def transaccion_pago_debito_proveedor
  	self.subcuenta_puc_id = 1105 if  banco =='Banco de Bogota Corriente 8414'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1110 if  banco =='Bancolombia Corriente 6464'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1115 if  banco =='Citibank Corriente 0035'
  end

  def transaccion_pago_debito_gasto
  	self.subcuenta_puc_id = 1105 if  banco =='Banco de Bogota Corriente 8414'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1110 if  banco =='Bancolombia Corriente 6464'
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, debito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  	self.subcuenta_puc_id = 1115 if  banco =='Citibank Corriente 0035'
  end

  def transaccion_pago_credito
  	self.subcuenta_puc_id = 2205
  	Transaccion.create!(pago_id: self.id, fecha: self.fecha, credito: self.importe, subcuenta_puc_id: self.subcuenta_puc_id)
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Colaboradore.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |pago|
        csv << pago.attributes.values_at(*column_names)
      end
    end
  end

end
