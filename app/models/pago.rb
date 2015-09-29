class Pago < ActiveRecord::Base
  belongs_to :proveedore
  has_many :factura_proveedors
  belongs_to :subcuenta_puc
  has_many :gastos
  has_many :incentivos
  has_many :pago_items


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
