class Clase < ActiveRecord::Base
	has_many :grupos

	def self.import(file)
	  	CSV.foreach(file.path, headers: true) do |row|
	  		Clase.create! row.to_hash
	  	end
	end
end
