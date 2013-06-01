#<!--Despacho por Destino-->
class Report5Pdf < Prawn::Document
	def initialize()
    super()
    marginx1 = 110
    marginx2 = 300
    marginx3 = marginx2 + 130
	# 
    move_down 35
	text "DESPACHOS POR DESTINO", :align => :center, :size => 15 
	text "01-01-2013 17:15:22", :align => :right  #Fecha y hora

	stroke_line [0, 620], [540, 620]

	move_down 40
	text "PRODUCTOR", :size => 13
	move_down 10
	y_current = cursor
	text "<u>Razon Social</u>", :inline_format => true  
	text_box ": Berries Hacienda Barros Negros", :at => [marginx1, y_current] #RAZON SOCIAL DEL DESTINO
	move_down 7
	y_current = cursor
	text "<u>Rut</u>", :inline_format => true
	text_box ": 33.333.333-3", :at => [marginx1, y_current] #RUT DEL DESTINO

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

	data = [ ["Nro Despacho", "Nro Pallet","Variedad", "Calidad","Fecha","Envase","Envases","Peso Neto"],#dejar como está, los siguientes son los campos a llenar
			["1", "01PALLET2013","Taylor", "IQF", "01-01-2013", "Bandeja Frambuesa", "70", "154,00"],##ESTAS SON LAS FILAS A INGRESAR
			["1", "<No Aplica>","Taylor", "Media", "01-01-2013", "Bandeja Frambuesa", "200", "154,00"] ]

	table(data , :width => 540, :cell_style => { :size => 10 }) 

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