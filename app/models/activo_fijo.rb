class ActivoFijo < ActiveRecord::Base
  belongs_to :gasto
  belongs_to :subcuenta_puc

  def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	  	ActivoFijo.create! row.to_hash
	  end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |activo_fijo|
				csv << activo_fijo.attributes.values_at(*column_names)
			end
		end
	end
end
