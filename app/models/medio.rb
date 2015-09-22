class Medio < ActiveRecord::Base
  belongs_to :proveedore
  belongs_to :presupuesto
  belongs_to :escala
  has_many :ordenes, dependent: :destroy
  has_many :presupuestos, :through => :ordenes
  has_many :factura_items
  validates  :nombre, presence: true #:proveedore_id,
 	
 def self.search(search)
  where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
 end

 def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	Medio.create! row.to_hash
	  end
 end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |medio|
				csv << medio.attributes.values_at(*column_names)
			end
		end
	end
end
