class Medio < ActiveRecord::Base
  belongs_to :proveedore
  belongs_to :presupuesto
  has_many :ordenes, dependent: :destroy
  has_many :presupuestos, :through => :ordenes
  has_many :factura_items
  validates :proveedore_id, :nombre, :nit, presence: true
  validates :nit, length: {is: 11}
 	
 def self.search(search)
  where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
 end

 def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	Meido.create! row.to_hash
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
