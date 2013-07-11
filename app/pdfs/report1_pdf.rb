#<!--Precio por Productor-->
class Report1Pdf < Prawn::Document

	def initialize(producer, data, view)
		super()
		@producer = producer
		if data.length == 1
			@kind = data[0][0]
			@mtrxx = data[0][1]
			report_info(data)
		else
			report_info(data)
		end
		report_foot()
	end

	def report_info(data)
		report_head()
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
		move_down 7
		y_current = cursor

		if data != nil
			for i in (0 .. (data.length-1))
				@kind = data[i][0]
				@mtrxx = data[i][1]
				if @kind != nil

					stroke_line [0, cursor], [540, cursor]

					move_down 10
					y_current = cursor
					text "Especie", :size => 13

					text_box ": #{@kind.name}", :at => [marginx1, y_current], :style => :bold #TIPO DE EMVASE

					stroke_line [marginx1, cursor], [540, cursor]

					move_down 20

					if @mtrxx!= nil and @mtrxx.length>0
						datos = [["Nro Ingreso","Fecha","Variedad","Calidad","Precio(Kgs.)"]]#dejar como está y llenar las siguientes filas
						lista = []
						lista << @mtrxx[0].id
						lista << @mtrxx[0].receipt_datetime.strftime("%d/%m/%Y")
						lista << @mtrxx[0].variety_name
						lista << @mtrxx[0].quality_name
						lista << @mtrxx[0].price_per_unit
						datos << lista
						table(datos , :width =>540)
						move_down 20
					else
						datos = [["Nro Ingreso","Fecha","Variedad","Calidad","Precio(Kgs.)"]]#dejar como está y llenar las siguientes filas
						lista = ["-","-","-","-","-"]
						datos << lista
						table(datos , :width =>540)
						move_down 20
					end
				end
			end
		end

		stroke_line [0, cursor], [540, cursor]

		move_down 7
		y_current = cursor
		stroke_line [0, cursor], [540, cursor]

		move_down 20
	end

	def report_head()
		image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		move_down 35
		text "PRECIO POR PRODUCTOR", :align => :center, :size => 15
		text "#{Time.now.strftime("%x")} #{Time.now.strftime("%X")}", :align => :right
		stroke_line [0, cursor], [540, cursor]
	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end

end