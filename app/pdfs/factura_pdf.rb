class FacturaPdf < Prawn::Document
	def initialize(factura)
		super()
		@factura = factura
		logo
		factura_id
		cliente
		factura_items
		format
		
	end

	

	def logo
		image "#{Rails.root}/app/assets/images/Logo_ideamos.jpg", :width => 150, :height => 30
	end

	def factura_id
		move_down 10
		text "Factura de Venta:   \No.  #{@factura.id}", size: 10, style: :bold
	end

	def cliente
		move_down 15
		text "Cliente:", size: 10, style: :bold
		text " #{@factura.cliente.nombre}", size: 10
		text " #{@factura.cliente.nit}", size: 10
		text " #{@factura.cliente.direccion_de_facturacion}", size: 10
		text " #{@factura.cliente.ciudad}", size: 10
		text " #{@factura.cliente.codigo_postal}", size: 10
		text " #{@factura.cliente.pais}", size: 10
	end

	def factura_items
		move_down 40
		table factura_item_rows
	end

	def factura_item_rows
		[['Fecha', 'Medio', 'Cantidad', 'Descuento', 'Iva', 'Subtotal', 'Total']] + @factura.factura_items.map do |item|
			[item.fecha_orden, item.medio.nombre, item.cantidad, item.descuento, item.iva, item.subtotal, item.total]
		end	
	end

	def format
		stroke_axis
	end
	
		
end