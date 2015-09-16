class OrdenePdf < Prawn::Document
	def initialize(presupuesto, ordene, view)
		super()
		@presupuesto = presupuesto
		@ordene = ordene
		@view = view
		logo
		ordene_id
		producto
		cliente
		orden
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_ideamos.jpg", :width => 150, :height => 30
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def ordene_id
		bounding_box([0, 670], :width => 150, :height => 15) do
		text "Orden No." , size: 10, style: :bold
		end
		bounding_box([50, 670], :width => 150, :height => 15) do
		text " #{@ordene.id}" , size: 10
		end
	end

  	def producto
  		bounding_box([350, 620], :width => 150, :height => 15) do
    		text 'Producto:', size: 10, style: :bold
		end

		bounding_box([400, 620], :width => 150, :height => 15) do
    		text "#{@presupuesto.producto}", size: 10
		end

		bounding_box([350, 590], :width => 150, :height => 15) do
    		text 'Ejecutivo:', size: 10, style: :bold
		end
		bounding_box([400, 590], :width => 150, :height => 15) do
    		text "#{@presupuesto.cliente.colaboradore.nombre}", size: 10
		end
  	end

	def cliente
  		text_box "Ideamos Publicidad LTDA. 860.076.863-6", size: 10, style: :bold,
				 :at => [0, 650],
				 :height => 15,
				 :width => 200
		text_box "Telefono: 3847777", size: 10, style: :bold,
				 :at => [350, 650],
				 :height => 15,
				 :width => 200
		text_box "Cliente:", size: 10, style: :bold,
				 :at => [0, 620],
				 :height => 15,
				 :width => 200
		text_box "#{@presupuesto.cliente.nombre}", size: 10,
				 :at => [50, 620],
				 :height => 15,
				 :width => 200
		text_box "Nit:", size: 10, style: :bold,
				 :at => [0, 590],
				 :height => 15,
				 :width => 200	
		text_box "#{@presupuesto.cliente.nit}", size:10,
				 :at => [25, 590],
				 :height => 15,
				 :width => 200	
		text_box "Medio:", size: 10, style: :bold,
				 :at => [0, 560],
				 :height => 15,
				 :width => 200	
		text_box "#{@ordene.medio.nombre}", size:10,
				 :at => [50, 560],
				 :height => 15,
				 :width => 200 
	end

	def orden
			text_box "Fecha", size: 10, style: :bold,
				 :at => [0, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.fecha_orden}", size:8,
				 :at => [0, 495],
				 :height => 15,
				 :width => 200	 
			text_box "Cantidad", size: 10, style: :bold,
				 :at => [80, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.cantidad}", size:8,
				 :at => [80, 495],
				 :height => 15,
				 :width => 200	
			text_box "Costo Unidad", size: 10, style: :bold,
				 :at => [150, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.costo_unidad}", size:8,
				 :at => [150, 495],
				 :height => 15,
				 :width => 200	
			text_box "Descuento", size: 10, style: :bold,
				 :at => [250, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.descuento}", size:8,
				 :at => [250, 495],
				 :height => 15,
				 :width => 200	
			text_box "Iva", size: 10, style: :bold,
				 :at => [330, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.iva}", size:8,
				 :at => [330, 495],
				 :height => 15,
				 :width => 200	
			text_box "Subtotal", size: 10, style: :bold,
				 :at => [400, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.subtotal}", size:8,
				 :at => [400, 495],
				 :height => 15,
				 :width => 200	
			text_box "Total", size: 10, style: :bold,
				 :at => [500, 510],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.total}", size:8,
				 :at => [500, 495],
				 :height => 15,
				 :width => 200	
			text_box "Ubicacion:", size: 10, style: :bold,
				 :at => [0, 480],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.ubicacion}", size:8,
				 :at => [0, 465],
				 :height => 15,
				 :width => 200	
			text_box "Unidad:", size: 10, style: :bold,
				 :at => [150, 480],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.unidad}", size:8,
				 :at => [150, 465],
				 :height => 15,
				 :width => 200	
			text_box "Notas:", size: 10, style: :bold,
				 :at => [0, 430],
				 :height => 15,
				 :width => 200
			text_box "#{@ordene.notas}", size:8,
				 :at => [40, 430],
				 :height => 15,
				 :width => 200	
	end
end