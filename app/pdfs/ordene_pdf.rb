class OrdenePdf < Prawn::Document
	def initialize(presupuesto, ordene, view)
		super(page_layout: :landscape)
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
				:at => [0, 560],
				:width => 150,
				:height => 15
		text_box " #{@ordene.id}" , size: 10,
				:at => [60, 560],
				:width => 150,
		 		:height => 15
	end

	def ejecutivo
		text_box "Titulo:" , size: 10, style: :bold,
				:at => [220, 500],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.titulo}" , size: 10,
				:at => [280, 500],
				:width => 150,
		 		:height => 15
		text_box "Ejecutivo:" , size: 10, style: :bold,
				:at => [450, 500],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.cliente.colaboradore.try(:nombre)}" , size: 10,
				:at => [510, 500],
				:width => 150,
		 		:height => 15
		text_box "Producto:" , size: 10, style: :bold,
				:at => [220, 470],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.producto}" , size: 10,
				:at => [280, 470],
				:width => 150,
		 		:height => 15
	end

	def cliente
  		text_box "Ideamos Publicidad LTDA. 860.076.863-6", size: 10, style: :bold,
				 :at => [0, 500],
				 :height => 15,
				 :width => 200
		text_box "Telefono: 3847777", size: 10, style: :bold,
				 :at => [0, 490],
				 :height => 15,
				 :width => 200
		text_box "Cliente:", size: 10, style: :bold,
				 :at => [220, 560],
				 :height => 15,
				 :width => 200
		text_box "#{@presupuesto.cliente.nombre}", size: 10,
				 :at => [260, 560],
				 :height => 15,
				 :width => 200
		text_box "Nit:", size: 10, style: :bold,
				 :at => [220, 530],
				 :height => 15,
				 :width => 200
		text_box "#{@presupuesto.cliente.numero_de_documento}", size:10,
				 :at => [260, 530],
				 :height => 15,
				 :width => 200
		text_box "Proveedor:",  size: 10, style: :bold,
				 :at =>  [450, 560],
				 :height => 15,
				 :width => 200
		text_box "#{@ordene.proveedore.nombre}", size:10,
				 :at =>  [510, 560],
				 :height => 15,
				 :width => 200
		text_box "Nit:",  size: 10, style: :bold,
				 :at =>  [450, 530],
				 :height => 15,
				 :width => 200
		text_box "#{@ordene.proveedore.numero_de_documento}", size:10,
				 :at =>  [500, 530],
				 :height => 15,
				 :width => 200
	end

	def orden_items
		move_down 60
			table orden_item_rows, :width => 750 do
				row(0..1000).border_width = 0
				row(0).font_style = :bold
				row(0..1000).size = 8
				self.header = true
			end
	end

	def orden_item_rows
		[['Fecha', 'Medio', 'Cm', 'Col', 'Cantidad', 'Costo Unidad', 'Ubicacion', 'Formato', 'Color', 'Ref. Preventa', 'Notas', 'Subtotal', 'Descuento', 'Iva', 'Total']] + @ordene.orden_items.map do |item|
			[item.fecha_item, item.medio.nombre, item.cm, item.col, item.cantidad, price(item.costo_unidad), item.ubicacion, item.formato, item.color, item.referencia_preventa, item.notas, price(item.subtotal), price(item.importe_descuento), price(item.iva), price(item.total)]
		end
	end

	def total
		move_down 15
			text "Subtotal #{price(@ordene.subtotal)}", size: 8, style: :bold, :align => :right
		move_down 5
			text "Iva #{price(@ordene.iva)}", size: 8, style: :bold, :align => :right
		move_down 5
			text "Total #{price(@ordene.total)}",size: 8, style: :bold, :align => :right
	end
end
