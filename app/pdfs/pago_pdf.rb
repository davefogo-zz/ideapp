class PagoPdf < Prawn::Document
	def initialize(pago, view)
		super()
		@pago = pago
		@view = view
		logo
		pago_id
		ideamos
		proveedor
		pago_items
		pronto_pago
		incentivo
		total
		
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_ideamos.jpg", :width => 150, :height => 30
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def pago_id
		bounding_box([0, 670], :width => 150, :height => 15) do
		text "Orden de Pago No." , size: 10, style: :bold
		end
		bounding_box([110, 670], :width => 150, :height => 15) do
		text " #{@pago.id}" , size: 10
		end
	end

	def ideamos
		bounding_box([0, 640], :width => 300, :height => 15) do
			text "Ideamos Publicidad LTDA. 860.076.863-6", size: 10, style: :bold
		end
	end

	def proveedor
	  		bounding_box([350, 710], :width => 150, :height => 15) do
	    		text 'Proveedor:', size: 10, style: :bold
			end
			bounding_box([370, 695], :width => 150, :height => 15) do
	    		text "#{@pago.proveedore.nombre}", size: 10
			end
			bounding_box([350, 670], :width => 150, :height => 15) do
	    		text 'Nit:', size: 10, style: :bold
	    	end
	    	bounding_box([370, 655], :width => 150, :height => 15) do
	    		text "#{@pago.proveedore.nit}", size: 10
			end
	  	end

  	def pago_items
	move_down 60
		table pago_item_rows, :width => 550 do
			row(0..1000).border_width = 0
			row(0).font_style = :bold
			self.header = true
		end
	end


	def pago_item_rows
		[[ 'Item No.', 'Factura Proveedor Numero', 'Importe Factura Proveedor', 'Forma de Pago', 'Orden No.', 'Importe']] + @pago.pago_items.map do |item|
			[item.id, item.factura_proveedor.id, price(item.factura_proveedor.importe), item.forma_de_pago, item.factura_proveedor.ordene.id,   price(item.importe)]
		end	
	end	

	def pronto_pago
		move_down 80
		text " - Pronto Pago #{price(@pago.importe_pronto_pago)}", :align => :right, style: :bold
	end

	def incentivo
		move_down 15
		text " - Incentivo #{price(@pago.incentivo_total)}", :align => :right, style: :bold
	end

	def total
		move_down 15
			text "Total #{price(@pago.total)}", style: :bold, :align => :right								   
	end


end