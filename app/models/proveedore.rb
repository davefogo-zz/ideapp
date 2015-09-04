class Proveedore < ActiveRecord::Base
  has_many :medios, dependent: :destroy
  has_many :transaccions
  has_many :ajustes
  #validates :nombre, :nit, :telefono, :direccion, :contacto_financiero, :contacto_comercial, presence: true
  
  def self.search(search)
  	where("nombre LIKE ? OR nit LIKE ?", "%#{search}%", "%#{search}%")
  end

  def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	Proveedore.create! row.to_hash
	  end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |proveedore|
				csv << proveedore.attributes.values_at(*column_names)
			end
		end
	end

end
