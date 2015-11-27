class Pago < ActiveRecord::Base
  belongs_to :proveedore
  has_many :factura_proveedors
  belongs_to :subcuenta_puc
  has_many :gastos
  has_many :incentivos
  has_many :pago_items, dependent: :destroy
 
  after_initialize :calculo_importe_pronto_pago, :calculo_incentivo_total,  :subtotal, :calculo_total

  def calculo_importe_pronto_pago
    self.importe_pronto_pago = self.pago_items.sum(:importe_pronto_pago)
  end

  def calculo_incentivo_total
    self.incentivo_total = self.incentivos.sum(:valor_incentivo)
  end

  def subtotal
    self.pago_items.sum(:importe)
  end

  def calculo_total
    self.total = self.subtotal - self.incentivo_total - self.importe_pronto_pago
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
