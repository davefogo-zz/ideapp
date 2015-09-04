class Colaboradore < ActiveRecord::Base
  belongs_to :user
  belongs_to :departamento
  belongs_to :cargo
  has_many :clientes
  validates :cedula, presence: true

	def self.search(search)
		where("nombre LIKE ? OR cedula LIKE ?", "%#{search}%", "%#{search}%")
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	Colaboradore.create! row.to_hash
	  end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |colaboradore|
				csv << colaboradore.attributes.values_at(*column_names)
			end
		end
	end
end
