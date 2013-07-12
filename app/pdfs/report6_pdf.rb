#<!--Productores-->
class Report6Pdf < Prawn::Document
	def initialize(data, view)
		super()
		if data!= nil and data.length == 1
			@producer = data[0][0]
			@kinds = data[0][1]
			report_info()
		else
			if data!= nil
				for i in (0 .. (data.length-1))
					@producer = data[i][0]
					@kinds = data[i][1]
					report_info()
					if i <= data.length-2
						start_new_page
					end
				end
			end
			report_foot()
		end
	end

	def report_info()
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
		text "<u>Giro</u>", :inline_format => true
		text_box ": #{@producer.line_of_business}", :at => [marginx1, y_current]
		
		move_down 7
		y_current = cursor
		text "<u>Region</u>", :inline_format => true
		@region = Region.find(:all,
	    		:from => 'regions, communes',
	    		:select => 'regions.id, regions.name',
	    		:conditions => ["communes.id = ? and communes.region_id=regions.id",@producer.commune_id]).first
		text_box ": #{@region.name}", :at => [marginx1, y_current]
		
		move_down 7
		y_current = cursor
		text "<u>Comuna</u>", :inline_format => true
		@commune = Commune.find(@producer.commune_id)
		text_box ": #{@commune.name}", :at => [marginx1, y_current]

		move_down 7
		y_current = cursor
		text "<u>Localidad</u>", :inline_format => true
		text_box ": #{@producer.locality_id}", :at => [marginx1, y_current]
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Direccion</u>", :inline_format => true
		end
		text_box ": #{@producer.address}", :at => [marginx3, y_current]

		move_down 7
		y_current = cursor
		text "<u>Contacto</u>", :inline_format => true
		text_box ": #{@producer.contact}", :at => [marginx1, y_current]
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Telefono</u>", :inline_format => true
		end
		text_box ": #{@producer.phone}", :at => [marginx3, y_current]

		stroke_line [0, cursor], [540, cursor]

		move_down 10
		y_current = cursor
		text "ESPECIES:  ", :size => 13
		move_down 7
		y_current = cursor
		@kinds.each do |kind|
			draw_text "#{kind.name}", :at => [marginx1, y_current], :style => :bold
			y_current = cursor
			move_down 10
			y_current = cursor
		end
		move_down 7
		y_current = cursor
		stroke_line [0, cursor], [540, cursor]

		move_down 20
	end

	def report_head()
		image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		move_down 35
		text "PRODUCTOR ESPECIE", :align => :center, :size => 15
		text "#{Time.now.strftime("%x")} #{Time.now.strftime("%X")}", :align => :right
		stroke_line [0, cursor], [540, cursor]
	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end
end