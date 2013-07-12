#<!--REPORTE DE PAGO INGRESO DE PACKING-->
class Report10Pdf < Prawn::Document
	def initialize(receiptPackingPayment, data, view)
		super()
		@receiptPackingPayment = receiptPackingPayment
		@producer = @receiptPackingPayment.producer
		report_info(data)
		report_foot()
	end

	def report_info(data)
		report_head()
		marginx1 = 110
	    marginx2 = 300
	    marginx3 = marginx2 + 130 
	    	
    	if data.length != 0
    		@kind = Kind.find{|e| e.id = @receiptPackingPayment.kind_id}
			move_down 10
			y_current = cursor
			text "PRODUCTO", :size => 13
			text_box ": #{@kind.name}", :at => [marginx1, y_current], :style => :bold #TIPO DE EMVASE
			stroke_line [marginx1, cursor], [540, cursor]

			move_down 20
			bounding_box([210, cursor], :width => 200) do
				datos =  [["Pallet", "Variedad", "Peso Neto", "Precio P/Unidad", "Subtotal"]]#dejar como está y llenar las siguientes filas
				datos <<  data
				table(datos , :width =>340)
			end
		
			move_down 20
			y_current = cursor
			text_box "Total a Pagar", :at => [marginx2, y_current], :style => :bold
			text_box ":", :at => [marginx3, y_current], :style => :bold
			text_box "#{data[4]}", :at => [marginx3, y_current], :style => :bold, :align => :right #SUMA DE LOS EMBASES QUE TIENE/FALTA
			
			move_down 20
			stroke_line [0, cursor], [540, cursor]
		end	
	end

	def report_head()
		#header
		repeat(:all) do
			image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		end
		move_down 35
		text "COMPROBANTE PAGO DE INGRESO", :align => :center, :size => 15 
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