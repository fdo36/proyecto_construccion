#<!--Envases Destino-->
class Report4Pdf < Prawn::Document
    def initialize(destination, data, view)
		super()
		@destination = destination
		if data!=nil and data.length>0
			report_info(data)
		end
		report_foot()
	end

	def report_info(data)
		report_head()
    	marginx1 = 110
    	marginx2 = 300
    	marginx3 = marginx2 + 130
		
		for i in (0 .. (data.length-1))
			if data[i][1].length != 0
		    	@pack_type =data[i][0]
		    	@mtrxx = data[i][1]
		    	
	    		stroke_line [0, cursor], [540, cursor]

				move_down 10
				y_current = cursor
				text "ENVASE", :size => 13
				text_box ": #{@pack_type.name}", :at => [marginx1, y_current], :style => :bold #TIPO DE EMVASE
				stroke_line [marginx1, cursor], [540, cursor]

				move_down 20

				# CODIGO CORRECTO
				suma = 0
				bounding_box([270, cursor], :width => 200) do
					datos =  [["Fecha", "Cantidad de Envases"]]#dejar como está y llenar las siguientes filas
					for i in (0 .. (@mtrxx.length-1))
						suma = suma + Integer(@mtrxx[i][1][0])
						datos <<  ["#{@mtrxx[i][0][0]}", "#{@mtrxx[i][1][0]}"] 
					end
					table(datos , :width =>270)
				end
			

				move_down 20
				y_current = cursor
				text_box "Total Envases", :at => [marginx2, y_current], :style => :bold
				text_box ":", :at => [marginx3, y_current], :style => :bold
				text_box "#{suma}", :at => [marginx3, y_current], :style => :bold, :align => :right #SUMA DE LOS EMBASES QUE TIENE/FALTA
				
				move_down 20
				stroke_line [0, cursor], [540, cursor]
			end
		end
	end

	def report_head()
		#header
		marginx1 = 110
    	marginx2 = 300
    	marginx3 = marginx2 + 130
		repeat(:all) do
			image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		end
		move_down 35
		text "ENVASES DESTINO", :align => :center, :size => 15 
		text "#{Time.now.strftime("%x")} #{Time.now.strftime("%X")}", :align => :right

		stroke_line [0, 620], [540, 620]

		move_down 40
		text "DESTINO", :size => 13
		move_down 10
		y_current = cursor
		text "<u>Razon Social</u>", :inline_format => true  
		text_box ": #{@destination.name}", :at => [marginx1, y_current] #RAZON SOCIAL DEL DESTINO
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": #{@destination.rut}", :at => [marginx1, y_current] #RUT DEL PRODUCTOR

		stroke_line [0, cursor], [540, cursor]

	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end
end