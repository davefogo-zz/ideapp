class SubcuentaPuc < ActiveRecord::Base
  belongs_to :cuenta_puc
  has_many :transaccions
  has_many :pago_items
  #validates :descripcion, presence: true, uniqueness: true 
  
	def self.search(search)
		 where("subcuenta LIKE ? OR descripcion LIKE ?", "%#{search}%", "%#{search}%")
	end

	def self.import(file)
	  	CSV.foreach(file.path, headers: true) do |row|
	  		SubcuentaPuc.create! row.to_hash
	  	end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |subcuenta_puc|
				csv << subcuenta_puc.attributes.values_at(*column_names)
			end
		end
	end
end
