class AjustePdf < Prawn::Document
	def initialize(ajuste, view)
		super()
		@ajuste = ajuste
		@view = view
		logo
		ajuste_id
		fechas
		cliente
		proveedore
		transaccions
		transaccion_rows
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_Ideamos.jpg", :width => 150, :height => 30
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def ajuste_id
		bounding_box([0, 670], :width => 150, :height => 15) do
		text "Recibo de Caja No." , size: 10, style: :bold
		end
		bounding_box([110, 670], :width => 150, :height => 15) do
		text " #{@ajuste.id}" , size: 10
		end
	end

	def fechas
  		bounding_box([350, 710], :width => 150, :height => 15) do
    		text 'Fecha:', size: 10, style: :bold
		end
		bounding_box([385, 710], :width => 150, :height => 15) do
    		text "#{@ajuste.fecha}", size: 10
		end
  	end

  	def cliente
		bounding_box([0, 640], :width => 150, :height => 15) do
			text "Cliente:", size: 10, style: :bold
		end
		bounding_box([0, 625], :width => 150, :height => 15) do
			text " #{@ajuste.cliente.nombre}", size: 10
		end
		text " #{@ajuste.cliente.numero_de_documento}", size: 10
		text " #{@ajuste.cliente.direccion_de_facturacion}", size: 10
		text " #{@ajuste.cliente.ciudad}", size: 10
		text " #{@ajuste.cliente.codigo_postal}", size: 10
		text " #{@ajuste.cliente.pais}", size: 10
	end

def proveedore
		bounding_box([200, 640], :width => 150, :height => 15) do
			text "Proveedor:", size: 10, style: :bold
		end
		bounding_box([200, 625], :width => 150, :height => 15) do
			text " #{@ajuste.proveedore.nombre}", size: 10
		end
		text " #{@ajuste.proveedore.numero_de_documento}", size: 10
		text " #{@ajuste.proveedore.direccion}", size: 10
	end

	def transaccions
		move_down 10
			table transaccion_rows, :width => 550 do
				row(0..1000).border_width = 0
				row(0).font_style = :bold
				self.header = true
			end
	end


	def transaccion_rows
		[['Fecha', 'Cuenta', 'Nombre de Cuenta', 'Credito', 'Debito']] + @ajuste.transaccions.map do |item|
			[item.fecha, item.subcuenta_puc_id, item.subcuenta_puc.descripcion, price(item.try(:credito)), price(item.try(:debito))]
		end	
	end
end