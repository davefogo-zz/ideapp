class Ajuste < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :proveedore
  has_many :transaccions, dependent: :destroy

  def self.import(file)
	 CSV.foreach(file.path, headers: true) do |row|
	  	Ajuste.create! row.to_hash
	  end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |ajuste|
				csv << ajuste.attributes.values_at(*column_names)
			end
		end
	end
end
