#<!--Facturación a Productores-->
class Report2Pdf < Prawn::Document

	def initialize()
		super()
	    marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130
		# 
	    move_down 35
		text "FACTURACION PRODUCTOR", :align => :center, :size => 15 
		text "01-01-2013 17:15:22", :align => :right  #Fecha y hora

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
		text "ESPECIE", :size => 13
		text_box ": Frambuesa", :at => [marginx1, y_current], :style => :bold #ESPECIE
		stroke_line [marginx1, cursor], [540, cursor]
		move_down 7
		y_current = cursor
		text "VARIEDAD", :size => 13
		text_box ": Taylor", :at => [marginx1, y_current], :style => :bold #VARIEDAD
		stroke_line [marginx1, cursor], [540, cursor]

		move_down 20

		data = [ ["Nro Ingreso", "Fecha", "Calidad","Peso Neto(Kgs.)","Precio","Total $"],#dejar como está, los siguientes son los campos a llenar
				["1", "01-01-2013", "IQF", "154,00", "900", "138.600,00"],##ESTAS SON LAS FILAS A INGRESAR
				["1", "01-01-2013", "Media", "550,00", "740", "407.600,00"] ]

		table(data , :width => 540) 

		move_down 20

		stroke_line [0, cursor], [540, cursor]

		move_down 20
		y_current = cursor
		text_box "Total Kgs.", :at => [marginx2, y_current], :style => :bold
		text_box ":", :at => [marginx3, y_current], :style => :bold
		text_box "704,40", :at => [marginx3, y_current], :style => :bold, :align => :right #SUMA TOTAL EN KGS
		move_down 20
		y_current = cursor
		text_box "Total a Pagar $", :at => [marginx2, y_current], :style => :bold
		text_box ":", :at => [marginx3, y_current], :style => :bold
		text_box "545.896,00", :at => [marginx3, y_current], :style => :bold, :align => :right #TOTAL A PAGAR AL FINAL

		#header
		repeat(:all) do
			image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		end
		#footer
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end

end