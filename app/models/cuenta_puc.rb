class CuentaPuc < ActiveRecord::Base
  belongs_to :grupo
  has_many :subcuenta_pucs
  
    def self.import(file)
	  	CSV.foreach(file.path, headers: true) do |row|
	  		CuentaPuc.create! row.to_hash
	  	end
    end

    def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |cuenta_puc|
				csv << cuenta_puc.attributes.values_at(*column_names)
			end
		end
	end
end
