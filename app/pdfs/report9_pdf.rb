#<!--Producto por productor-->
class Report9Pdf < Prawn::Document
	def initialize(producer, data, view)
		super()
		@producer = producer
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
		    	@kind =data[i][0]
		    	@mtrxx1 = data[i][1]
		    	for j in (0 .. (@mtrxx1.length-1))
		    		if @mtrxx1[j][1].length != 0
                        @variety = @mtrxx1[j][0]
                        @mtrxx = @mtrxx1[j][1]
						move_down 10
						y_current = cursor
						text "PRODUCTO", :size => 13
						text_box ": #{@kind.name}/#{@variety.name}", :at => [marginx1, y_current], :style => :bold #TIPO DE EMVASE
						stroke_line [marginx1, cursor], [540, cursor]

						move_down 20

						bounding_box([270, cursor], :width => 200) do
							datos =  [["Fecha", "Nro Ingreso", "Codigo Pallet", "Peso Bruto", "Precio P/Unidad"]]#dejar como está y llenar las siguientes filas
							for i in (0 .. (@mtrxx.length-1))
								datos <<  @mtrxx[i]
							end
							table(datos , :width =>270)
						end
					

						y_current = cursor
						move_down 20
						stroke_line [0, cursor], [540, cursor]
					end
				end
			end
		end	
	end

	def report_head()
		#header
		repeat(:all) do
			image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		end
		move_down 35
		text "PRODUCTOS POR PRODUCTOR", :align => :center, :size => 15 
		text "#{Time.now.strftime("%x")} #{Time.now.strftime("%X")}", :align => :right

		stroke_line [0, 620], [540, 620]

		marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130
		
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
	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end
end