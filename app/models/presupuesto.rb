class Presupuesto < ActiveRecord::Base
  belongs_to :cliente
  has_many :ordenes, dependent: :destroy
  accepts_nested_attributes_for :ordenes
  has_many :medios, :through => :ordenes
  has_one :factura
  validates :fecha, :titulo, :cliente_id, :producto, presence: true

  after_initialize :calculate_subtotal, :calculate_iva, :calculate_total 

   def calculate_subtotal
    self.subtotal = self.ordenes.sum(:subtotal)
   end

   def calculate_iva
    self.iva = self.ordenes.sum(:iva)
   end

   def calculate_total
    self.total = subtotal + iva
   end

  def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	Presupuesto.create! row.to_hash
	  end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |presupuesto|
				csv << presupuesto.attributes.values_at(*column_names)
			end
		end
	end
end
