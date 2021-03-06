class EmptyDestinationPdf < Prawn::Document

	def initialize(destiny, data)
		super()

		@destiny = destiny
		@data = data


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
		text_box ": #{@destiny.name}", :at => [marginx1, y_current]
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": #{@destiny.rut}", :at => [marginx1, y_current]

		stroke_line [0, cursor], [540, cursor]
		move_down 7
		y_current = cursor
		####
		move_down 10
		text "DETALLE", :size => 13
		move_down 10
		y_current = cursor

		datos = Hash.new()
		total = 0
		for i in (0 .. (@data.length-1))
			if datos[@data[i].optionp].nil? 
				datos[@data[i].optionp] = Hash.new()
				datos[@data[i].optionp][1] = []
				datos[@data[i].optionp][2] = 0
				datos[@data[i].optionp][1] << ["Fecha","Envase","Cantidad"]
			end
			date = Time.zone.parse(@data[i].created).utc.strftime('%d/%m/%Y   %H:%M:%S')
			datos[@data[i].optionp][1] << [date, @data[i].namep, @data[i].quantity]
			datos[@data[i].optionp][2] = datos[@data[i].optionp][2] + @data[i].quantity
		end


		datos.each { |key, value| 
			
			move_down 7
			y_current = cursor
			text "<u>Operacion</u>", :inline_format => true
			text_box ": #{key}", :at => [marginx1, y_current]
			move_down 7
			table(value[1], :width =>540)
			move_down 7
			y_current = cursor
			text_box "Total envases #{key}", :inline_format => true, :at => [marginx1+130, y_current]
			total = value[2]
			text_box ": #{total}", :at => [marginx1+280, y_current]
			move_down 10
		 }

	end

	def report_head()

		image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		move_down 35
		text "Envases Destino", :align => :center, :size => 15
		text "#{Time.now.strftime("%x")}   #{Time.now.strftime("%X")}", :align => :right
	end

	def report_foot()

		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end

end