class OrdenePdf < Prawn::Document
	def initialize(presupuesto, ordene, view)
		super()
		@presupuesto = presupuesto
		@ordene = ordene
		@view = view
		logo
		ordene_id
		ejecutivo
		cliente
		orden_items
		total
	end

	def logo
		image "#{Rails.root}/app/assets/images/Logo_Ideamos.jpg", :width => 150, :height => 30
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def ordene_id
		text_box "Orden No." , size: 10, style: :bold,
				:at => [0, 670],
				:width => 150,
				:height => 15
		text_box " #{@ordene.id}" , size: 10,
				:at => [50, 670], 
				:width => 150,
		 		:height => 15
	end

	def ejecutivo
		 text_box "Ejecutivo:" , size: 10, style: :bold,
				:at => [350, 590],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.cliente.colaboradore.try(:nombre)}" , size: 10,
				:at => [400, 590], 
				:width => 150,
		 		:height => 15
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
		text_box "#{@presupuesto.cliente.numero_de_documento}", size:10,
				 :at => [25, 590],
				 :height => 15,
				 :width => 200	
		text_box "Proveedor:", size: 10, style: :bold,
				 :at => [0, 560],
				 :height => 15,
				 :width => 200	
		text_box "#{@ordene.proveedore.nombre}", size:10,
				 :at => [60, 560],
				 :height => 15,
				 :width => 200 
	end

def orden_items
		move_down 120
			table orden_item_rows, :width => 750 do
				row(0..1000).border_width = 0
				row(0).font_style = :bold
				row(0..1000).size = 6
				self.header = true
			end
	end

	def orden_item_rows
		[['Fecha', 'Medio', 'Cm', 'Col', 'Cantidad', 'Costo Unidad', 'Ubicacion', 'Formato', 'Color', 'Ref. Preventa', 'Notas', 'Descuento', 'Iva', 'Subtotal','Total']] + @ordene.orden_items.map do |item|
			[item.fecha_item, item.medio.nombre, item.cm, item.col, item.cantidad, price(item.costo_unidad), item.ubicacion, item.formato, item.color, item.referencia_preventa, item.notas, item.descuento, price(item.iva), price(item.subtotal), price(item.total)]
		end	
	end

	def total
		move_down 15
			text "Subtotal #{price(@presupuesto.subtotal)}", size: 8, style: :bold, :align => :right
		move_down 5
			text "Iva #{price(@presupuesto.iva)}", size: 8, style: :bold, :align => :right	
		move_down 5
			text "Total #{price(@presupuesto.total)}",size: 8, style: :bold, :align => :right										   
	end

	def orden
		text_box "Fecha", size: 10, style: :bold,
			 :at => [0, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.fecha_orden}", size:8,
			 :at => [0, 495],
			 :height => 15,
			 :width => 200	 
		text_box "Cantidad", size: 10, style: :bold,
			 :at => [80, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.cantidad}", size:8,
			 :at => [80, 495],
			 :height => 15,
			 :width => 200	
		text_box "Costo Unidad", size: 10, style: :bold,
			 :at => [150, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.costo_unidad}", size:8,
			 :at => [150, 495],
			 :height => 15,
			 :width => 200	
		text_box "Descuento", size: 10, style: :bold,
			 :at => [250, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.descuento}", size:8,
			 :at => [250, 495],
			 :height => 15,
			 :width => 200	
		text_box "Iva", size: 10, style: :bold,
			 :at => [330, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.iva}", size:8,
			 :at => [330, 495],
			 :height => 15,
			 :width => 200	
		text_box "Subtotal", size: 10, style: :bold,
			 :at => [400, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.subtotal}", size:8,
			 :at => [400, 495],
			 :height => 15,
			 :width => 200	
		text_box "Total", size: 10, style: :bold,
			 :at => [500, 510],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.total}", size:8,
			 :at => [500, 495],
			 :height => 15,
			 :width => 200	
		text_box "Ubicacion:", size: 10, style: :bold,
			 :at => [0, 480],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.ubicacion}", size:8,
			 :at => [0, 465],
			 :height => 15,
			 :width => 200	
		text_box "Unidad:", size: 10, style: :bold,
			 :at => [150, 480],
			 :height => 15,
			 :width => 200
		text_box "Medidas (CM X COL)", size: 10, style: :bold,
			 :at => [250, 480],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.cm}", size: 10, style: :bold,
			 :at => [300, 465],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.col}", size: 10, style: :bold,
			 :at => [330, 465],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.unidad}", size:8,
			 :at => [150, 465],
			 :height => 15,
			 :width => 200	
		text_box "Notas:", size: 10, style: :bold,
			 :at => [0, 430],
			 :height => 15,
			 :width => 200
		text_box "#{@orden_item.notas}", size:8,
			 :at => [40, 430],
			 :height => 15,
			 :width => 200	
	end

end