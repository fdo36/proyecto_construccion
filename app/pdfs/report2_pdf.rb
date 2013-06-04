#<!--Facturación a Productores-->
class Report2Pdf < Prawn::Document

	def initialize(data, view)
		super()
		
		if data!= nil
			for i in (0 .. (data.length-1))

				@producer = data[i][0]
				@todo = data[i][1]
				report_info()
				if i <= data.length-2
					start_new_page
				end
			end
		end
		report_foot()
	end

	def report_info()
		report_head()
	    marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130
		#

		move_down 40
		text "PRODUCTOR", :size => 13
		move_down 10
		y_current = cursor
		text "<u>Razon Social</u>", :inline_format => true  
		text_box ": #{@producer.name}", :at => [marginx1, y_current] #RAZON SOCIAL DEL PRODUCTOR
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": #{@producer.rut}", :at => [marginx1, y_current] #RUT DEL PRODUCTOR
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Codigo SAG</u>", :inline_format => true
		end
		text_box ": #{@producer.sag_code}", :at => [marginx3, y_current]#CODIGO SAG

		stroke_line [0, cursor], [540, cursor]

		for i in (0 .. (@todo.length-1))
			if @todo[i][1].length!=0
				move_down 10
				y_current = cursor
				text "ESPECIE", :size => 13
				text_box ": #{@todo[i][0].name}", :at => [marginx1, y_current], :style => :bold #ESPECIE
				stroke_line [marginx1, cursor], [540, cursor]

				@tabla2 = @todo[i][1]

				for j in (0 .. (@tabla2.length-1))
					if @tabla2[j][1].length!=0
						move_down 7
						y_current = cursor
						text "VARIEDAD", :size => 13
						text_box ": #{@tabla2[j][0].name}", :at => [marginx1, y_current], :style => :bold #VARIEDAD
						stroke_line [marginx1, cursor], [540, cursor]

						move_down 20

						datos = [ ["Nro Ingreso", "Fecha", "Calidad","Peso Neto(Kgs.)","Precio","Total $"]]#dejar como está, los siguientes son los campos a llenar
						@tabla3 = @tabla2[j][1]
						for k in (0 .. (@tabla3.length-1))
							datos << @tabla3[k]
						end
						table(datos , :width => 540)

						move_down 20

						stroke_line [0, cursor], [540, cursor]

						move_down 20
						y_current = cursor
						text_box "Total Kgs.", :at => [marginx2, y_current], :style => :bold
						text_box ":", :at => [marginx3, y_current], :style => :bold
						text_box "#{@tabla2[j][2]}", :at => [marginx3, y_current], :style => :bold, :align => :right #SUMA TOTAL EN KGS
						move_down 20
						y_current = cursor
						text_box "Total a Pagar $", :at => [marginx2, y_current], :style => :bold
						text_box ":", :at => [marginx3, y_current], :style => :bold
						text_box "#{@tabla2[j][3]}", :at => [marginx3, y_current], :style => :bold, :align => :right #TOTAL A PAGAR AL FINAL
					end
				end
			end
		end
	end

	def report_head()
		image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		move_down 35
		text "FACTURACION PRODUCTOR", :align => :center, :size => 15
		text "#{Time.now.strftime("%x")} #{Time.now.strftime("%X")}", :align => :right
		stroke_line [0, cursor], [540, cursor]
	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end

end