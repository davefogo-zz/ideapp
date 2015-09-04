class ReciboDeCaja < ActiveRecord::Base
  belongs_to :cliente
  has_many :recibo_items


	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |recibo_de_caja|
				csv << recibo_de_caja.attributes.values_at(*column_names)
			end
		end
	end
end
