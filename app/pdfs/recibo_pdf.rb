class ReciboPdf < Prawn::Document
	def initialize(recibo_de_caja, view)
		super()
		@recibo_de_caja = recibo_de_caja
		@view = view
		logo
		recibo_de_caja_id
		ideamos
		proveedor
		recibo_de_caja_rows
		forma_de_pago
		#pronto_pago_recibo_de_caja
		
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_ideamos.jpg", :width => 150, :height => 30
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

	def ideamos
		bounding_box([0, 670], :width => 300, :height => 15) do
			text "Ideamos Publicidad LTDA. 860.076.863-6", size: 10, style: :bold
		end
	end

	def proveedor
	  		bounding_box([350, 710], :width => 150, :height => 15) do
	    		text 'Cliente:', size: 10, style: :bold
			end
			bounding_box([370, 695], :width => 150, :height => 15) do
	    		text "#{@recibo_de_caja.factura.cliente.nombre}", size: 10
			end
			bounding_box([350, 670], :width => 150, :height => 15) do
	    		text 'Nit:', size: 10, style: :bold
	    	end
	    	bounding_box([370, 655], :width => 150, :height => 15) do
	    		text "#{@recibo_de_caja.factura.cliente.nit}", size: 10
			end
	  	end

	def recibo_de_caja_rows
		bounding_box([0, 600], :width => 150, :height => 15) do
	    		text "Fecha: #{@recibo_de_caja.fecha}", size: 10, style: :bold
			end
			bounding_box([150, 600], :width => 150, :height => 15) do
	    		text "Factura: #{@recibo_de_caja.factura.id}", size: 10, style: :bold
	    	end
			bounding_box([250, 600], :width => 150, :height => 15) do
				text "Importe: #{price(@recibo_de_caja.importe)}", size: 10, style: :bold
			end
	end	

	def forma_de_pago
		bounding_box([0, 550], :width => 150, :height => 15) do
	    		text "Forma de Pago: #{@recibo_de_caja.forma_de_pago}", size: 10, style: :bold
			end
			bounding_box([300, 550], :width => 150, :height => 15) do
	    		text "Nro Cheque: #{@recibo_de_caja.numero_de_cheque}", size: 10, style: :bold
	    	end
	    	bounding_box([150, 550], :width => 150, :height => 15) do
	    		text "Banco: #{@recibo_de_caja.subcuenta_puc_id.try(:descripcion)}", size: 10, style: :bold
	    	end
	end	

	#def pronto_pago_recibo_de_caja
		#move_down 80
		#text " + Pronto Pago #{price(@recibo_de_caja.factura.cliente.pronto_pago)}", :align => :right, style: :bold
	#end

end