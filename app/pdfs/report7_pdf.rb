#<!--Destinos-->
class Report7Pdf < Prawn::Document
	def initialize(data, view)
		super()
		if data!= nil and data.length == 1
			@destination = data[0]
			report_info()
		else
			if data!= nil
				for i in (0 .. (data.length-1))
					@destination = data[i]
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
		text "DESTINO", :size => 13
		move_down 10
		y_current = cursor
		text "<u>Razon Social</u>", :inline_format => true
		text_box ": #{@destination.name}", :at => [marginx1, y_current]
		move_down 7
		y_current = cursor
		text "<u>Rut</u>", :inline_format => true
		text_box ": #{@destination.rut}", :at => [marginx1, y_current]
		move_down 7
		y_current = cursor
		text "<u>Region</u>", :inline_format => true
		@region = Region.find(:all,
	    		:from => 'regions, communes',
	    		:select => 'regions.id, regions.name',
	    		:conditions => ["communes.id = ? and communes.region_id=regions.id",@destination.commune_id]).first
		text_box ": #{@region.name}", :at => [marginx1, y_current]
		move_down 7
		y_current = cursor
		text "<u>Comuna</u>", :inline_format => true
		@commune = Commune.find(@destination.commune_id)
		text_box ": #{@commune.name}", :at => [marginx1, y_current]
		move_down 7
		
		#text "<u>Localidad</u>", :inline_format => true
		#text_box ": #{@destination.locality_id}", :at => [marginx1, y_current]
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Direccion</u>", :inline_format => true
		end
		text_box ": #{@destination.address}", :at => [marginx3, y_current]

		move_down 7
		y_current = cursor
		text "<u>Contacto</u>", :inline_format => true
		text_box ": #{@destination.contact}", :at => [marginx1, y_current]
		bounding_box([marginx2, y_current], :width => 200, :height => 20) do
			text "<u>Telefono</u>", :inline_format => true
		end
		text_box ": #{@destination.phone}", :at => [marginx3, y_current]
		move_down 7
		y_current = cursor
		text "<u>E-mail</u>", :inline_format => true
		text_box ": #{@destination.email}", :at => [marginx1, y_current]

		stroke_line [0, cursor], [540, cursor]

		move_down 20
		
	end

	def report_head()
		image "#{Prawn::BASEDIR}/data/images/23.png", :at => [-36, 756], :scale => 0.5
		move_down 35
		text "DESTINOS", :align => :center, :size => 15
		text "#{Time.now.strftime("%x")} #{Time.now.strftime("%X")}", :align => :right
		stroke_line [0, cursor], [540, cursor]
	end

	def report_foot()
		number_pages "<page>/<total>", :at => [bounds.right - 50, 0]
	end
end