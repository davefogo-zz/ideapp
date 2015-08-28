class FacturaPdf < Prawn::Document
	def initialize(factura, view)
		super()
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_ideamos.jpg", :width => 150, :height => 30
	end
end