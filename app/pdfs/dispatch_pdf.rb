#<!--Precio por Productor-->
class DispatchPdf < Prawn::Document

	def initialize(dispatch, destination, kind, pack ,pallets)
		super()

		@dispatch = dispatch
		@destination = destination
		@kind = kind
		@pack = pack
		@pallets = pallets
		
		report_head()

		report_info()

		report_foot()
	end

	def report_info()
		marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130

	    move_down 20
		text "DESTINO", :size => 13
		move_down 10
		y_current = cursor
		text "<u>Razon Social</u>", :inline_format => true
		text_box ": #{@destination.name}", :at => [marginx1, y_current]
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": #{@destination.rut}", :at => [marginx1, y_current]
		stroke_line [0, cursor], [540, cursor]
		move_down 7
		y_current = cursor
		####
		move_down 10
		text "DETALLE DE DESPACHO", :size => 13
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
				datos[@pack[i].vname] << ["Codigo", "Fecha","Calidad","Cantidad","Envase", "Peso"]
			end
			totalW =  Integer(@pack[i].weight) - (Integer(@pack[i].quantity) * Integer(@pack[i].tare))
			total = ""	
			datos[@pack[i].vname] << ["", @pack[i].created, @pack[i].qname, @pack[i].quantity, @pack[i].namept, totalW]
		end

		for i in (0 .. (@pallets.length-1))
			if datos[@pallets[i].vname].nil? 
				datos[@pallets[i].vname] = []
				datos[@pallets[i].vname] << ["Codigo", "Fecha","Calidad","Cantidad","Envase", "Peso"]
			end
			totalW =  Integer(@pallets[i].weight) - (Integer(@pallets[i].quantity) * Integer(@pallets[i].tare)) - Integer(@pallets[i].tarep)
			datos[@pallets[i].vname] << [@pallets[i].code, @pallets[i].created, @pallets[i].qname,@pallets[i].quantity , @pallets[i].namept, totalW]
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
		text "Despacho de Productos Nro: " + @dispatch.id.to_s, :align => :center, :size => 15
		parsed_time = @dispatch. dispatch_datetime.strftime('%d/%m/%Y   %H:%M:%S')
		text parsed_time.to_s, :align => :right
	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end

end