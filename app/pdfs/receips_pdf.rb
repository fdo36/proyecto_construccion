class ReceipsPdf < Prawn::Document

	def initialize(receipt, producer, kind, pack, pallets)
		super()

		@receipt = receipt
		@producer = producer
		@kind = kind
		@pallets = pallets
		@pack = pack


		report_head()

		report_info()

		report_foot()
	end

	def report_info()
		marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130

	    move_down 20
		text "PRODUCTOR", :size => 13
		move_down 10
		y_current = cursor
		text "<u>Razon Social</u>", :inline_format => true
		text_box ": #{@producer.name}", :at => [marginx1, y_current]
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": #{@producer.rut}", :at => [marginx1, y_current]
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Codigo SAG</u>", :inline_format => true
		end
		text_box ": #{@producer.sag_code}", :at => [marginx3, y_current]
		stroke_line [0, cursor], [540, cursor]
		move_down 7
		y_current = cursor
		####
		move_down 10
		text "DETALLE DE RECEPCION", :size => 13
		move_down 10
		y_current = cursor
		text "<b><u>Especie</u></b>", :inline_format => true , :size => 13
		text_box ": #{@kind.name}", :at => [marginx1, y_current] , :size => 13

		####
	    #tabla = [ ["Precio Unitario","Peso Neto","Variedad","Calidad"]]#dejar como está y llenar las siguientes filas
	    datos = Hash.new()
		for i in (0 .. (@pack.length-1))
			if datos[@pack[i].vname].nil? 
				datos[@pack[i].vname] = []
				datos[@pack[i].vname] << ["Calidad","Cantidad","Peso Neto","Precio(Kg.)"]
			end
			totalW =  Integer(@pack[i].weight) - (Integer(@pack[i].quantity) * Integer(@pack[i].tare))
			total = ""
			if @pack[i].price != ""
				total = Integer(@pack[i].quantity)*Integer(@pack[i].price)
			end	
			datos[@pack[i].vname] << [@pack[i].qname, @pack[i].quantity, totalW, total]
		end

		for i in (0 .. (@pallets.length-1))
			if datos[@pallets[i].vname].nil? 
				datos[@pallets[i].vname] = []
				datos[@pallets[i].vname] << ["Calidad","Cantidad","Peso Neto","Precio(Kg.)"]
			end
			totalW =  Integer(@pallets[i].weight) - (Integer(@pallets[i].quantity) * Integer(@pallets[i].tare)) - Integer(@pallets[i].tarep)
			total = ""
			if @pallets[i].price != ""
				total = Integer(@pallets[i].quantity)*Integer(@pallets[i].price)
			end
			datos[@pallets[i].vname] << [@pallets[i].qname, @pallets[i].quantity,totalW, total]
		end


		datos.each { |key, value| 
			
			move_down 7
			y_current = cursor
			text "<u>Variedad</u>", :inline_format => true
			text_box ": #{key}", :at => [marginx1, y_current]
			move_down 7
			table(value, :width =>540)
		 }



	end

	def report_head()

		image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		move_down 35
		text "Recepcion de Productos Nro: " + @receipt.id.to_s, :align => :center, :size => 15
		parsed_time = @receipt.receipt_datetime.strftime('%d/%m/%Y   %H:%M:%S')

		text parsed_time.to_s, :align => :right
	end

	def report_foot()

		stroke_line [50, 0+30], [220, 0+30]
		stroke_line [300, 0+30], [470, 0+30]
		text_box "V.B. RECEPCION", :inline_format => true , :at => [50+35, 0+20]
		text_box "V.B. PRODUCTOR", :inline_format => true , :at => [300+35, 0+20]

		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end

end