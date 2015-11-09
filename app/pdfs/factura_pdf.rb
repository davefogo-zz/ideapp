class FacturaPdf < Prawn::Document
	def initialize(factura, view)
		super()
		@factura = factura
		@view = view
		logo
		factura_id
		fechas
		producto
		cliente
		factura_items
		total
		footer
	end

	def logo
		repeat(:all) do
			image "#{Rails.root}/app/assets/images/Logo_Ideamos.jpg", :width => 150, :height => 30
		end
	end

	def price(num)
		@view.number_to_currency(num, :precision => 0)
	end

	def per(num)
		@view.number_to_percentage(num, :precision => 0)
	end

	def factura_id
		repeat(:all) do
			text_box "Factura de Venta No." , size: 10, style: :bold,
					:at => [0, 670],
					:width => 150,
					:height => 15
			text_box " #{@factura.id}" , size: 10,
					:at => [110, 670], 
					:width => 150,
			 		:height => 15
		end
	end

	def fechas
		repeat(:all) do
	  		text_box 'Fecha de Vencimiento:', size: 10, style: :bold,
	  				 :at => [390, 710], 
	  				 :width => 150,
	  		 		 :height => 15
			text_box "#{@factura.fecha_de_vencimiento}", size: 10,
					 :at => [500, 710], 
					 :width => 150,
			 		 :height => 15
			text_box 'Fecha de Expedicion:', size: 10, style: :bold,
					 :at => [390, 695], 
					 :width => 150,
			         :height => 15
	    	text_box "#{@factura.fecha_de_expedicion}", size: 10,
	    			:at => [500, 695], 
	    			:width => 150,
	    	 		:height => 15
	    end
    end

  	def producto
  		repeat(:all) do
	  		text_box 'Producto:', size: 10, style: :bold,
	  				:at => [390, 680], 
	  				:width => 150,
	  		 		:height => 15
			text_box "#{@factura.presupuesto.producto}", size: 10,
					:at => [455, 680], 
					:width => 150,
			 		:height => 15
			text_box 'Presupuesto:', size: 10, style: :bold,
					:at => [390, 665], 
					:width => 150,
			 		:height => 15
			text_box "#{@factura.presupuesto.id}", size: 10,
					:at => [480, 665], 
					:width => 150,
			 		:height => 15
			text_box 'Ejecutivo:', size: 10, style: :bold,
	  				:at => [390, 650], 
	  				:width => 150,
	  		 		:height => 15
			text_box "#{@factura.cliente.colaboradore.nombre}", size: 10,
					:at => [455, 650], 
					:width => 150,
			 		:height => 15
		end	
  	end


	def cliente
		repeat(:all) do
			text_box "Cliente:", size: 10, style: :bold,
					 :at => [170, 710],
					 :height => 15,
					 :width => 200
			text_box "#{@factura.cliente.nombre}", size: 10,
					 :at => [210, 710],
					 :height => 15,
					 :width => 200
			text_box "Nit:", size: 10, style: :bold,
					 :at => [170, 695],
					 :height => 15,
					 :width => 200	
			text_box "#{@factura.cliente.numero_de_documento}", size:10,
					 :at => [230, 695],
					 :height => 15,
					 :width => 200	
			text_box "Pais:", size: 10, style: :bold,
					 :at => [170, 680],
					 :height => 15,
					 :width => 200	
			text_box "#{@factura.cliente.pais}", size:10,
					 :at => [230, 680],
					 :height => 15,
					 :width => 200 
			text_box "Ciudad:", size: 10, style: :bold,
					 :at => [170, 665],
					 :height => 15,
					 :width => 200	
			text_box "#{@factura.cliente.ciudad}", size:10,
					 :at => [230, 665],
					 :height => 15,
					 :width => 200 
			text_box "Codigo Postal:", size: 10, style: :bold,
					 :at => [170, 650],
					 :height => 15,
					 :width => 200	
			text_box "#{@factura.cliente.codigo_postal}", size:10,
					 :at => [250, 650],
					 :height => 15,
					 :width => 200 
			text_box "Direccion:", size: 10, style: :bold,
					 :at => [170, 635],
					 :height => 15,
					 :width => 200	
			text_box "#{@factura.cliente.direccion_de_facturacion}", size:10,
					 :at => [230, 635],
					 :height => 15,
					 :width => 200 
		end	
	end

	def factura_items
		move_down 70
			stroke do
					horizontal_rule
			end
			table factura_item_rows, :width => 550 do
				row(0..1000).border_width = 0
				row(0..1000).size = 8
				row(0).font_style = :bold
				row(0).size = 8
				self.header = true
			end
	end

	def factura_item_rows
		[['Fecha', 'Medio', 'Cantidad', 'Costo Unidad', 'Ubicacion', 'Notas', 'Iva', 'Subtotal', 'Total']] + @factura.factura_items.map do |item|
			[item.fecha_orden, item.medio.nombre, item.cantidad, price(item.costo_unidad), item.ubicacion, item.notas, price(item.iva), price(item.subtotal), price(item.total)]
		end	
	end

	def total
		move_down 15
			text "Subtotal #{price(@factura.subtotal)}", style: :bold, :align => :right
		move_down 5
			text "Iva #{price(@factura.iva)}", style: :bold, :align => :right
		move_down 5
			text "Ret. Iva  - #{price(@factura.ret_iva)}", style: :bold, :align => :right
		move_down 5
			text "Ret. Ica  - #{price(@factura.ret_ica)}", style: :bold, :align => :right	
		move_down 5
			text "Total #{price(@factura.total - @factura.ret_iva - @factura.ret_ica)}", style: :bold, :align => :right										   
	end


	def footer
		stroke do
				horizontal_rule
		end
		move_down 5
			    text "Ingresos recibidos para terceros, NO efectuar Retención en la Fuente  o Retención de IVA e ICA o Retención del  CREE Con la firma de aceptado y recibido se entiende que el cliente (comprador y/o beneficiario del servicio)  acepta el contendio de la factura y confirma el recibo a satisfacción del bien y/o  servicio objeto de la factura, siendo  entendido que la firma diferente del cliente  implica que dicha persona se entiende autorizada para tales efectos por el cliente. La devolución de facturas y/o presentación de reclamos solo podra hacerse por escrito, en el termino previsto en la ley, en el Departamento de Cartera, Carrera 7 No. 74-56 Of. 1101, 384 7777. En caso de mora se causaran los intereses legales vigentes. Páguese con cheque cruzado a favor  de IDEAMOS PUBLICIDAD LTDA o páguese con transferencia a cualquiera de estas cuentas: Corriente Banco de Bogotá 223-46841-4, Corriente Citibank No. 1006676495 o consignado a el Crédito del Banco de Bogotá No. 418-510010-88. Conforme al concepto 009174 del 2002 por la DIAN, la solicitud del cliente para el cambio de fecha de la emisión de la presente factura no modificara el registro original de la operación, ni la fecha de vencimiento, la cual se determino a  partir de la fecha de circulación. Internacionales: páguese con cheque en  doláres o con transferencia a la cuenta corriente 53801 de Banco de Bogota Miami SWIFT:BBOGUS3 ABA:66010720 de IDEAMOS PUBLICIDAD LTDA", size: 7	         
		move_down 2
			text "Autorización de Numeracion para Facturación por computador DIAN resol 320001198572 de Octubre 23 de 2014 de 50826 hasta 100000. Codigo CIIU 7310 Tarifa 9.66 x 1000 No  Somos Grandes Contribuyentes. No  Somos Autorretenedores. Somos Responsables del IVA. Régimen Comun.", size: 7
		move_down 1
			stroke do
				horizontal_rule
			end
		move_down 40
			text "Elaborado                          Aprobado                          Firma de Aceptado y Recibido del Cliente", :align => :center
			stroke do
				horizontal_rule
			end
		move_down 2
			text "Autorizo expresamente a IDEAMOS PUBLICIDAD LTDA, para que mis datos personales ya sea como persona natural, sociedad, y/o representante legal y/o socio. Sean consultados en cualquier  base de datos en las centrales de riesgo y/o información comercial exista o pueda existir en el futuro. Igualmente los autorizo para que en caso de mora en mis obligaciones comerciales, sea reportado a la base de datos que elija IDEAMOS PUBLICIDAD LTDA. La persona que firma la factura obra en mi nombre y representación, por lo tanto esta autorizacion es igualmente valida, acepto que si a la fecha de hoy estoy en mora o en un futuro presento retraso en los pagos, he sido notificado, de acuerdo a la ley `1266 de 2008 ´habeas data. Esta factura se asimila en sus efectos a la letra de cambio.", size: 7
		move_down 2
			text "IMPRESO POR: IDEAMOS PUBLICIDAD Nit. 860.076.863-6 CARRERA 7 NO. 74 -56 OF. 1101. BOGOTÁ 3847777 IDEAMOS.CO en ideapp v 1.0", size: 7, style: :bold
		move_down 2
			text "ORIGINAL", size: 8, :align => :center

		string = "pagina <page> de <total>"
		options = { :at => [bounds.right - 150, 0], :width => 150, :start_count_at => 1, :size => 8}
  		number_pages string, options	
	end
end