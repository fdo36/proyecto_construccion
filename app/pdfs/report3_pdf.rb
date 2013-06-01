#<!--Envases Productor-->
class Report3Pdf < Prawn::Document
	def initialize()
		super()
		marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130
		# 
	    move_down 35
		text "ENVASES PRODUCTOR", :align => :center, :size => 15 
		text "01-01-2013 17:15:22", :align => :right  #FECHA Y HORA

		stroke_line [0, 620], [540, 620]

		move_down 40
		text "PRODUCTOR", :size => 13
		move_down 10
		y_current = cursor
		text "<u>Razon Social</u>", :inline_format => true  
		text_box ": Berries Hacienda Barros Negros", :at => [marginx1, y_current] #RAZON SOCIAL DEL PRODUCTOR
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": 33.333.333-3", :at => [marginx1, y_current] #RUT DEL PRODUCTOR
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Codigo SAG</u>", :inline_format => true
		end
		text_box ": COM07S11419", :at => [marginx3, y_current]#CODIGO SAG

		stroke_line [0, cursor], [540, cursor]

		move_down 10
		y_current = cursor
		text "ENVASE", :size => 13
		text_box ": Bandeja Frambuesa", :at => [marginx1, y_current], :style => :bold #TIPO DE EMVASE
		stroke_line [marginx1, cursor], [540, cursor]

		move_down 20

		bounding_box([270, cursor], :width => 200) do
			data = [ ["Fecha","Cantidad de Envases"],#dejar como está y llenar las siguientes filas
				["01-01-2013", "-70"],##ESTAS SON LAS FILAS A INGRESAR
				["01-01-2013", "-250"] ]

		table(data , :width => 270) 
		end

		move_down 20
		y_current = cursor
		text_box "Total Envases", :at => [marginx2, y_current], :style => :bold
		text_box ":", :at => [marginx3, y_current], :style => :bold
		text_box "-380,00", :at => [marginx3, y_current], :style => :bold, :align => :right #SUMA DE LOS EMBASES QUE TIENE/FALTA
		
		move_down 20

		stroke_line [0, cursor], [540, cursor]

		#header
		repeat(:all) do
			image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		end
		#footer
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]

	end
end