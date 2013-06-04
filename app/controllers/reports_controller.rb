class ReportsController < ApplicationController
  

  def index
  end

  def create
    @report_type = params[:report_type]

    if @report_type=="1"
    	@producer_id = params[:Productores1]
    	@kind_id = params[:Especies1]
    	
    	@year_inicio = params[:start_date1]['year']
    	@mes_inicio = params[:start_date1]['month']
    	@dia_inicio = params[:start_date1]['day']
    	@fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio}"

    	@year_termino = params[:end_date1]['year']
    	@mes_termino = params[:end_date1]['month']
    	@dia_termino = params[:end_date1]['day']
    	@fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino}"


    	@producer = Producer.find(@producer_id)

    	if @kind_id==""
    		#todos
    		mtrxx = []

    		@kinds = Kind.find(:all,
	    		:from => 'kinds, kinds_producers',
	    		:select => 'kinds.id, kinds.name',
	    		:conditions => ["kinds.id=kinds_producers.kind_id and 
	    			kinds_producers.producer_id=?",@producer_id])

    		@kinds.each do |kind|
    			@ingresos = Receipt.find(:all,
	    		:from => 'receipts, varieties, qualities, pallets, producers',
	    		:select => 'receipts.code, receipts.receipt_datetime, varieties.name, qualities.name, pallets.price_per_unit',
	    		:conditions => ["producers.id=? and producers.id=receipts.producer_id and 
	    			receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
	    			receipts.kind_id=? and pallets.receipt_id
	    			=receipts.id and varieties.id=pallets.variety_id and qualities.id=pallets.quality_id",@producer_id, 
	    			@fecha_inicio, @fecha_termino, kind.id])
    			mtrxx << [[kind, @ingresos]]
    		end
    		pdf = Report1Pdf.new(@producer, mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    	else
    		#especifico
    		@kind = Kind.find(@kind_id)

    		@ingresos = Receipt.find(:all,
	    		:from => 'receipts, varieties, qualities, pallets, producers',
	    		:select => 'receipts.code, receipts.receipt_datetime, varieties.name, qualities.name, pallets.price_per_unit',
	    		:conditions => ["producers.id=? and producers.id=receipts.producer_id and 
	    			receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
	    			receipts.kind_id=? and pallets.receipt_id
	    			=receipts.id and varieties.id=pallets.variety_id and qualities.id=pallets.quality_id",@producer_id, 
	    			@fecha_inicio, @fecha_termino, @kind_id])

    		mtrxx = [[@kind, @ingresos]]
    		pdf = Report1Pdf.new(@producer, mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    	end
    end

    if @report_type=="2"

        @producer_id = params[:Productores2]
        @kind_id = params[:Especies2]

        @year_inicio = params[:start_date2]['year']
        @mes_inicio = params[:start_date2]['month']
        @dia_inicio = params[:start_date2]['day']
        @fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio}"

        @year_termino = params[:end_date2]['year']
        @mes_termino = params[:end_date2]['month']
        @dia_termino = params[:end_date2]['day']
        @fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino}"

        if @producer_id!=""
            #solo para uno
            if @kind_id==""
                #Para 1 productor todas las especies
                mtrxx = []
                @producer = Producer.find(@producer_id)
                @kinds = Kind.all
                kind_variety = []

                @kinds.each do |kind|
                    variety_receipts = []
                    @varieties = Variety.find(:all,
                        :from => 'varieties',
                        :select => 'varieties.id, varieties.name',
                        :conditions => ['varieties.kind_id=?',kind.id])

                    @varieties.each do |variety|
                        @datos = Receipt.find(:all,
                        :from => 'receipts, qualities, pallets, producers',
                        :select => 'receipts.code, receipts.receipt_datetime, qualities.name, pallets.gross_weight ,pallets.price_per_unit',
                        :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                            receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                            receipts.kind_id=? and pallets.receipt_id
                            =receipts.id and pallets.variety_id=? and qualities.id=pallets.quality_id",@producer_id, 
                            @fecha_inicio, @fecha_termino, kind.id, variety.id])

                        puts "algoooooooooooooooooooooooooooo"
                        puts @datos.length

                        temp = []
                        totalKGS = 0
                        totalPrice = 0
                        @datos.each do |dato|
                            roww = []
                            roww << dato.code
                            roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                            roww << dato.name
                            roww << dato.gross_weight
                            roww << dato.price_per_unit
                            roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            totalKGS = totalKGS + dato.gross_weight.to_f
                            totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            temp << roww
                        end

                        @datos = Receipt.find(:all,
                        :from => 'receipts, qualities, pack_group_receipts, producers',
                        :select => 'receipts.code, receipts.receipt_datetime, qualities.name, pack_group_receipts.gross_weight ,pack_group_receipts.price_per_unit',
                        :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                            receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                            receipts.kind_id=? and pack_group_receipts.receipt_id
                            =receipts.id and pack_group_receipts.variety_id=? and qualities.id=pack_group_receipts.quality_id",@producer_id, 
                            @fecha_inicio, @fecha_termino, kind.id, variety.id])

                        puts "algoooooooooooooooooooooooooooo"
                        puts @datos.length

                        @datos.each do |dato|
                            roww = []
                            roww << dato.code
                            roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                            roww << dato.name
                            roww << dato.gross_weight
                            roww << dato.price_per_unit
                            roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            totalKGS = totalKGS + dato.gross_weight.to_f
                            totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            temp << roww
                        end
                        variety_receipts << [variety, temp, totalKGS, totalPrice]
                    end
                    kind_variety << [kind, variety_receipts]
                end
                mtrxx << [@producer, kind_variety]

                pdf = Report2Pdf.new(mtrxx,view_context)
                send_data pdf.render,
                    type: "application/pdf",
                    disposition: "inline"
            else
                #Para 1 productor 1 especie
                mtrxx = []
                @producer = Producer.find(@producer_id)
                @kind = Kind.find(@kind_id)

                kind_variety = []

                @varieties = Variety.find(:all,
                    :from => 'varieties',
                    :select => 'varieties.id, varieties.name',
                    :conditions => ['varieties.kind_id=?',@kind_id])

                variety_receipts = []
                @varieties.each do |variety|
                    #Para pallets
                    @datos = Receipt.find(:all,
                    :from => 'receipts, qualities, pallets, producers',
                    :select => 'receipts.code, receipts.receipt_datetime, qualities.name, pallets.gross_weight ,pallets.price_per_unit',
                    :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                        receipts.kind_id=? and pallets.receipt_id
                        =receipts.id and pallets.variety_id=? and qualities.id=pallets.quality_id",@producer_id, 
                        @fecha_inicio, @fecha_termino, @kind_id, variety.id])

                    temp = []
                    totalKGS = 0
                    totalPrice = 0
                    @datos.each do |dato|
                        roww = []
                        roww << dato.code
                        roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                        roww << dato.name
                        roww << dato.gross_weight
                        roww << dato.price_per_unit
                        roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                        totalKGS = totalKGS + dato.gross_weight.to_f
                        totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                        temp << roww
                    end

                    @datos = Receipt.find(:all,
                    :from => 'receipts, qualities, pack_group_receipts, producers',
                    :select => 'receipts.code, receipts.receipt_datetime, qualities.name, pack_group_receipts.gross_weight ,pack_group_receipts.price_per_unit',
                    :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                        receipts.kind_id=? and pack_group_receipts.receipt_id
                        =receipts.id and pack_group_receipts.variety_id=? and qualities.id=pack_group_receipts.quality_id",@producer_id, 
                        @fecha_inicio, @fecha_termino, @kind_id, variety.id])

                    @datos.each do |dato|
                        roww = []
                        roww << dato.code
                        roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                        roww << dato.name
                        roww << dato.gross_weight
                        roww << dato.price_per_unit
                        roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                        totalKGS = totalKGS + dato.gross_weight.to_f
                        totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                        temp << roww
                    end

                    variety_receipts << [variety, temp, totalKGS, totalPrice]
                end

                kind_variety << [@kind, variety_receipts]

                mtrxx << [@producer, kind_variety]

                pdf = Report2Pdf.new(mtrxx,view_context)
                send_data pdf.render,
                    type: "application/pdf",
                    disposition: "inline"
            end
        end
    end


    if @report_type=="3"
    	@producer_id = params[:Productores3]
    	@pack_type_id = params[:Envases3]

    	@year_inicio = params[:start_date3]['year']
    	@mes_inicio = params[:start_date3]['month']
    	@dia_inicio = params[:start_date3]['day']
    	@fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio} 00:00:00"

    	@year_termino = params[:end_date3]['year']
    	@mes_termino = params[:end_date3]['month']
    	@dia_termino = params[:end_date3]['day']
    	@fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino} 23:59:59"
		
		@producer = Producer.find(@producer_id)

    	if @pack_type_id ==""
            mtrxx = []
            @pack_types = PackType.all

            #SALIDA DE ENVASES POR PRESTAMOS
            #
            # # # # # # # # # # #

            #INGRESO DE ENVASES POR PALLETS
            @pack_types.each do |pack_type|
                @datos = Pallet.find(:all,
                    :select => 'receipts.receipt_datetime, pallets.quantity',
                    :from => 'receipts, pallets, producers, pack_types',
                    :conditions => ["producers.id=? and
                        producers.id = receipts.producer_id and
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
                        receipts.id=pallets.receipt_id and
                        pack_types.id=? and 
                        pallets.pack_type_id=pack_types.id",
                        @producer_id,@fecha_inicio, @fecha_termino, pack_type.id])
                temp = []

                @datos.each do |pallet|
                    fecha = "#{pallet.receipt_datetime.to_datetime.year}-#{pallet.receipt_datetime.to_datetime.month}-#{pallet.receipt_datetime.to_datetime.day}"
                    temp <<  [[fecha] , [pallet.quantity]]
                end

                 @datos = PackGroupReceipt.find(:all,
                    :select => 'receipts.receipt_datetime, pack_group_receipts.quantity',
                    :from => 'receipts, pack_group_receipts, producers, pack_types',
                    :conditions => ["producers.id=? and
                        producers.id = receipts.producer_id and
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
                        receipts.id=pack_group_receipts.receipt_id and
                        pack_types.id=? and 
                        pack_group_receipts.pack_type_id=pack_types.id",
                        @producer_id,@fecha_inicio, @fecha_termino, pack_type.id])
                @datos.each do |pallet|
                    fecha = "#{pallet.receipt_datetime.to_datetime.year}-#{pallet.receipt_datetime.to_datetime.month}-#{pallet.receipt_datetime.to_datetime.day}"
                    temp <<  [[fecha] , [pallet.quantity]]
                end

                mtrxx << [pack_type, temp]
    		end
    		pdf = Report3Pdf.new(@producer, mtrxx, view_context)
    		send_data pdf.render,
	    		type: "application/pdf",
	    		disposition: "inline"
    	else
    		
    		@pack_type = PackType.find(@pack_type_id)

    		#SALIDA DE ENVASES POR PRESTAMOS
    		#
    		# # # # # # # # # # #

    		#INGRESO DE ENVASES POR PALLETS
    		
    		@datos = Pallet.find(:all,
 				:select => 'receipts.receipt_datetime, pallets.quantity',
	    		:from => 'receipts, pallets, producers, pack_types',
	    		:conditions => ["producers.id=? and
	    			producers.id = receipts.producer_id and
	    			receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
	    			receipts.id=pallets.receipt_id and
	    			pack_types.id=? and 
	    			pallets.pack_type_id=pack_types.id",
	    			@producer_id,@fecha_inicio, @fecha_termino, @pack_type_id])
            temp = []
            mtrxx = []
    		@datos.each do |pallet|
                year = pallet.receipt_datetime.to_datetime
    			fecha = "#{pallet.receipt_datetime.to_datetime.year}-#{pallet.receipt_datetime.to_datetime.month}-#{pallet.receipt_datetime.to_datetime.day}"
    			temp <<  [[fecha] , [pallet.quantity]]
    		 end

    		# INGRESO DE ENVASES POR PACK_GROUPS_RECEIPT
    		@datos = PackGroupReceipt.find(:all,
	    		:from => 'receipts, pack_group_receipts, producers, pack_types',
	    		:select => 'receipts.receipt_datetime, pack_group_receipts.quantity',
	    	    :conditions => ["producers.id=? and
                    producers.id = receipts.producer_id and
                    receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
                    receipts.id=pack_group_receipts.receipt_id and
                    pack_types.id=? and 
                    pack_group_receipts.pack_type_id=pack_types.id",
                    @producer_id,@fecha_inicio, @fecha_termino, @pack_type_id])
            @datos.each do |pack_group_receipt|
               fecha = "#{pallet.receipt_datetime.to_datetime.year}-#{pallet.receipt_datetime.to_datetime.month}-#{pallet.receipt_datetime.to_datetime.day}"
                temp <<  [[fecha] , [pack_group_receipt.quantity]]
            end
            mtrxx << [@pack_type, temp ]

    		pdf = Report3Pdf.new(@producer, mtrxx, view_context)
    		send_data pdf.render,
	    		type: "application/pdf",
	    		disposition: "inline"

		end
    end

    if @report_type=="4"

        @destination_id = params[:Destinos4]
        @pack_type_id = params[:Envases4]

        @year_inicio = params[:start_date4]['year']
        @mes_inicio = params[:start_date4]['month']
        @dia_inicio = params[:start_date4]['day']
        @fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio} 00:00:00"

        @year_termino = params[:end_date4]['year']
        @mes_termino = params[:end_date4]['month']
        @dia_termino = params[:end_date4]['day']
        @fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino} 23:59:59"
        
        @destination = Destination.find(@destination_id)

        if @pack_type_id ==""
            mtrxx = []
            @pack_types = PackType.all

            #INGRESO DE ENVASES POR DEVOLUCIONES DEL DESTINO
            #
            # # # # # # # # # # #

            #INGRESO DE ENVASES POR DESPACHOS DE PALLETS
            @pack_types.each do |pack_type|
                @datos = Dispatch.find(:all,
                    :select => 'dispatches.dispatch_datetime, pallets.quantity',
                    :from => 'dispatches, pallets, destinations, pack_types',
                    :conditions => ["destinations.id=? and
                        destinations.id = dispatches.destination_id and
                        dispatches.id=pallets.dispatch_id and
                        dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and 
                        pack_types.id=? and 
                        pallets.pack_type_id=pack_types.id",
                        @destination_id, @fecha_inicio, @fecha_termino, pack_type.id])
                temp = []

                @datos.each do |pallet|
                    fecha = "#{pallet.dispatch_datetime.year}-#{pallet.dispatch_datetime.month}-#{pallet.dispatch_datetime.day}"
                    temp <<  [[fecha] , [pallet.quantity]]
                end

                @datos = Dispatch.find(:all,
                    :select => 'dispatches.dispatch_datetime, pack_group_dispatches.quantity',
                    :from => 'dispatches, pack_group_dispatches, destinations, pack_types',
                    :conditions => ["destinations.id=? and
                        destinations.id = dispatches.destination_id and
                        dispatches.id=pack_group_dispatches.dispatch_id and
                        dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and 
                        pack_types.id=? and 
                        pack_group_dispatches.pack_type_id=pack_types.id",
                        @destination_id, @fecha_inicio, @fecha_termino, pack_type.id])

                @datos.each do |pack|
                    fecha = "#{pack.dispatch_datetime.year}-#{pack.dispatch_datetime.month}-#{pack.dispatch_datetime.day}"
                    temp <<  [[fecha] , [pack.quantity]]
                 end
                 mtrxx << [pack_type, temp ]
            end
            pdf = Report4Pdf.new(@destination, mtrxx, view_context)
            send_data pdf.render,
                type: "application/pdf",
                disposition: "inline"
        else
            mtrxx = []
            @pack_type = PackType.find(@pack_type_id)

            #SALIDA DE ENVASES POR PRESTAMOS
            #
            # # # # # # # # # # #

            #INGRESO DE ENVASES POR PALLETS
            
            @datos = Dispatch.find(:all,
                :select => 'dispatches.dispatch_datetime, pallets.quantity',
                :from => 'dispatches, pallets, destinations, pack_types',
                :conditions => ["destinations.id=? and
                    destinations.id = dispatches.destination_id and
                    dispatches.id=pallets.dispatch_id and
                    dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and 
                    pack_types.id=? and 
                    pallets.pack_type_id=pack_types.id",
                    @destination_id, @fecha_inicio, @fecha_termino, @pack_type_id])
            temp = []

            @datos.each do |pallet|
                fecha = "#{pallet.dispatch_datetime.year}-#{pallet.dispatch_datetime.month}-#{pallet.dispatch_datetime.day}"
                temp <<  [[fecha] , [pallet.quantity]]
            end

            @datos = Dispatch.find(:all,
                :select => 'dispatches.dispatch_datetime, pack_group_dispatches.quantity',
                :from => 'dispatches, pack_group_dispatches, destinations, pack_types',
                :conditions => ["destinations.id=? and
                    destinations.id = dispatches.destination_id and
                    dispatches.id=pack_group_dispatches.dispatch_id and
                    dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and 
                    pack_types.id=? and 
                    pack_group_dispatches.pack_type_id=pack_types.id",
                    @destination_id, @fecha_inicio, @fecha_termino, @pack_type_id])

            @datos.each do |pack|
                fecha = "#{pack.dispatch_datetime.year}-#{pack.dispatch_datetime.month}-#{pack.dispatch_datetime.day}"
                temp <<  [[fecha] , [pack.quantity]]
            end
            mtrxx << [@pack_type, temp ]

            pdf = Report4Pdf.new(@destination, mtrxx, view_context)
            send_data pdf.render,
            type: "application/pdf",
            disposition: "inline"
        end
    end

    if @report_type=="5"
        
    end

    if @report_type=="6"
    	@producer = params[:Productores6]
    	if @producer==""
    		mtrxx = []

	    	@producers = Producer.all

	    	@producers.each do |producer|
	    		@kinds = Kind.find(:all,
		    		:from => 'kinds, kinds_producers',
		    		:select => 'id, name',
		    		:conditions => ["kinds_producers.producer_id = ? and kinds.id=kinds_producers.kind_id",producer.id])
	    		ary = [producer, @kinds]

	    		mtrxx<<ary
	    	end
	    	pdf = Report6Pdf.new(mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
	    else
	    	@producers = Producer.find(@producer)

    		@kinds = Kind.find(:all,
	    		:from => 'kinds, kinds_producers',
	    		:select => 'id, name',
	    		:conditions => ["kinds_producers.producer_id = ? and kinds.id=kinds_producers.kind_id",@producers.id])
	    	
	    	mtrxx = [[@producers, @kinds]]
	    	pdf = Report6Pdf.new(mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
	    end
	end

	if @report_type=="7"
		@destination_id = params[:Destinos7]
    
    	if @destination_id==""
    		mtrxx =  Destination.all
	    	pdf = Report7Pdf.new(mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
	    else
	    	@destinations = Destination.find(@destination_id)
	    	mtrxx = [@destinations]

			pdf = Report7Pdf.new(mtrxx, view_context)
    		send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    	end
	end

    respond_to do |format|
    	format.html {}
  	end
	end
end
