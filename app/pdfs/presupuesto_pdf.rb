class PresupuestoPdf < Prawn::Document
	def initialize(presupuesto, view)
		super(page_layout: :landscape)
		@presupuesto = presupuesto
		@view = view
		logo
		presupuesto_id
		ideamos
		fechas
		tipo_de_medio
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
			text_box "Presupuesto No." , size: 10, style: :bold,
					:at => [0, 560],
					:width => 150,
					:height => 15
			text_box " #{@presupuesto.id}" , size: 10,
					:at => [60, 560], 
					:width => 150,
			 		:height => 15
	end

	def ideamos
		text_box "Ideamos Publicidad LTDA. 860.076.863-6", size: 8,
				 :at => [0, 505],
				 :height => 15,
				 :width => 200
		text_box "Telefono: 3847777", size: 6,
				 :at => [0, 495],
				 :height => 15,
				 :width => 200
	end

	def fechas
		text_box "Fecha Orden:" , size: 8, style: :bold,
				:at => [200, 530],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.fecha}" , size: 8,
				:at => [270, 530], 
				:width => 150,
		 		:height => 15
	end

	def tipo_de_medio
		text_box "Tipo de Medio:" , size: 8, style: :bold,
				:at => [200, 530],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.tipo_de_medio}" , size: 8,
				:at => [270, 530], 
				:width => 150,
		 		:height => 15
	end

	def producto
		text_box "Producto:" , size: 8, style: :bold,
				:at => [500, 530],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.producto}" , size: 8,
				:at => [520, 615], 
				:width => 150,
		 		:height => 15
		text_box "Tipo de Medio:" , size: 8, style: :bold,
				:at => [630, 530],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.tipo_de_medio}" , size: 8,
				:at => [690, 530], 
				:width => 150,
		 		:height => 15
		text_box "Ejecutivo:" , size: 8, style: :bold,
				:at => [200, 510],
				:width => 150,
				:height => 15
		text_box " #{@presupuesto.cliente.colaboradore.try(:nombre)}" , size: 8,
				:at => [250, 510], 
				:width => 150,
		 		:height => 15
	end

	def cliente
  		text_box "Ideamos Publicidad LTDA. 860.076.863-6", size: 10, style: :bold,
				 :at => [0, 650],
				 :height => 15,
				 :width => 200
		text_box "Cliente:", size: 8, style: :bold,
				 :at => [330, 530],
				 :height => 15,
				 :width => 200
		text_box "#{@presupuesto.cliente.nombre}", size: 8,
				 :at => [370, 530],
				 :height => 15,
				 :width => 200
		text_box "Nit:", size: 8, style: :bold,
				 :at => [330, 510],
				 :height => 15,
				 :width => 200	
		text_box "#{@presupuesto.cliente.numero_de_documento}", size:8,
				 :at => [350, 510],
				 :height => 15,
				 :width => 200	 
	end

	def presupuesto_items
		move_down 40
			table presupuesto_item_rows, :width => 750 do
				row(0..1000).border_width = 0
				row(0).font_style = :bold
				row(0..1000).size = 6
				self.header = true
			end
	end

	def presupuesto_item_rows
		[['Fecha', 'Proveedor', 'Descuento', 'Iva', 'Subtotal','Total']] + @presupuesto.ordenes.map do |item|
			[item.fecha_orden, item.proveedore.nombre, item.descuento, price(item.iva), price(item.subtotal), price(item.total)]
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
	
end