class OrdenePdf < Prawn::Document
	def initialize(presupuesto, view)
		super()
		@presupuesto = presupuesto
		@view = view
		logo
		presupuesto_id
		fechas
		producto
		cliente
		presupuesto_items
		total
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_Ideamos.jpg", :width => 150, :height => 30
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def presupuesto_id
		bounding_box([0, 670], :width => 150, :height => 15) do
		text "Presupuesto No." , size: 10, style: :bold
		end
		bounding_box([100, 670], :width => 150, :height => 15) do
		text " #{@presupuesto.id}" , size: 10
		end
	end

	def fechas
  		bounding_box([350, 670], :width => 150, :height => 15) do
    		text 'Fecha:', size: 10, style: :bold
		end
		bounding_box([370, 655], :width => 150, :height => 15) do
    		text "#{@presupuesto.fecha}", size: 10
		end
  	end

  	def producto
  		bounding_box([350, 630], :width => 150, :height => 15) do
    		text 'Producto:', size: 10, style: :bold
		end

		bounding_box([370, 615], :width => 150, :height => 15) do
    		text "#{@presupuesto.producto}", size: 10
		end

		bounding_box([350, 590], :width => 150, :height => 15) do
    		text 'Ejecutivo:', size: 10, style: :bold
		end
		bounding_box([370, 575], :width => 150, :height => 15) do
    		text "#{@presupuesto.cliente.colaboradore.nombre}", size: 10
		end
  	end

	def cliente
  		text_box "Ideamos Publicidad LTDA. 860.076.863-6", size: 10, style: :bold,
				 :at => [0, 650],
				 :height => 15,
				 :width => 200
		text_box "Cliente:", size: 10, style: :bold,
				 :at => [0, 635],
				 :height => 15,
				 :width => 200
		text_box "#{@presupuesto.cliente.nombre}", size: 10,
				 :at => [20, 620],
				 :height => 15,
				 :width => 200
		text_box "Nit:", size: 10, style: :bold,
				 :at => [0, 605],
				 :height => 15,
				 :width => 200	
		text_box "#{@presupuesto.cliente.nit}", size:10,
				 :at => [20, 590],
				 :height => 15,
				 :width => 200	 
	end

	def presupuesto_items
		move_down 20
			table presupuesto_item_rows, :width => 550 do
				row(0..1000).border_width = 0
				row(0).font_style = :bold
				self.header = true
			end
	end

	def presupuesto_item_rows
		[['Fecha', 'Medio', 'Cantidad', 'Descuento', 'Iva', 'Subtotal','Total']] + @presupuesto.ordenes.map do |item|
			[item.fecha_orden, item.medio.nombre, item.cantidad, item.descuento, price(item.iva), price(item.subtotal), price(item.total)]
		end	
	end

	def total
		move_down 15
			text "Subtotal #{price(@presupuesto.subtotal)}", style: :bold, :align => :right
		move_down 5
			text "Iva #{price(@presupuesto.iva)}", style: :bold, :align => :right	
		move_down 5
			text "Total #{price(@presupuesto.total)}", style: :bold, :align => :right										   
	end
	
end