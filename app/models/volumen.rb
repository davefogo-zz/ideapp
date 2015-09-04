class Volumen < ActiveRecord::Base
  belongs_to :medio
  belongs_to :factura_item
  belongs_to :factura

  #def self.import(file)
	 #CSV.foreach(file.path, headers: true) do |row|
	  #Volumen.create! row.to_hash
	 #end
  #end

  #def self.to_csv
		#CSV.generate do |csv|
			#csv << column_names
			#all.each do |colaboradore|
				#csv << colaboradore.attributes.values_at(*column_names)
			#end
		#end
	#end
end
