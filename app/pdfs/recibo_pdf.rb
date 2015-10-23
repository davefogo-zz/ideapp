class ReciboPdf < Prawn::Document
	def initialize(recibo_de_caja, view)
		super()
		@recibo_de_caja = recibo_de_caja
		@view = view
		logo
		recibo_de_caja_id
		cliente
		factura_items
		#pronto_pago_recibo_de_caja
		
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_Ideamos.jpg", :width => 150, :height => 30
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def recibo_de_caja_id
		bounding_box([0, 640], :width => 150, :height => 15) do
		text "Recibo de Caja No." , size: 10, style: :bold
		end
		bounding_box([110, 640], :width => 150, :height => 15) do
		text " #{@recibo_de_caja.id}" , size: 10
		end
	end

	def cliente
	  		bounding_box([350, 710], :width => 150, :height => 15) do
	    		text 'Cliente:', size: 10, style: :bold
			end
			bounding_box([350, 695], :width => 150, :height => 15) do
	    		text "#{@recibo_de_caja.cliente.nombre}", size: 10
			end
			bounding_box([350, 670], :width => 150, :height => 15) do
	    		text 'Nit:', size: 10, style: :bold
	    	end
	    	bounding_box([350, 655], :width => 150, :height => 15) do
	    		text "#{@recibo_de_caja.cliente.nit}", size: 10
			end
	  	end

	  def factura_items
		move_down 50
			table factura_item_rows, :width => 550 do
				row(0..1000).border_width = 0
				row(0).font_style = :bold
				self.header = true
			end
	end

	def factura_item_rows
		[['Fecha', 'Importe', 'Forma de Pago', 'No. de Cheque', 'Banco Destino']] + @recibo_de_caja.recibo_items.map do |item|
			[item.fecha, price(item.importe), item.forma_de_pago, item.numero_de_cheque, item.subcuenta_puc_id]
		end	
		
	end

	

	#def pronto_pago_recibo_de_caja
		#move_down 80
		#text " + Pronto Pago #{price(@recibo_de_caja.recibo_item.factura.cliente.pronto_pago)}", :align => :right, style: :bold
	#end

end