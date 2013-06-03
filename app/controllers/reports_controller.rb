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
    	pdf = Report2Pdf.new()
    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    end


    if @report_type=="3"
    	@producer_id = params[:Productores3]
    	@pack_type_id = params[:Envases3]

    	@year_inicio = params[:start_date3]['year']
    	@mes_inicio = params[:start_date3]['month']
    	@dia_inicio = params[:start_date3]['day']
    	@fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio}"

    	@year_termino = params[:end_date3]['year']
    	@mes_termino = params[:end_date3]['month']
    	@dia_termino = params[:end_date3]['day']
    	@fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino}"
		
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
                    :select => 'pallets.created_at, pallets.quantity',
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
                    fecha = "#{pallet.created_at.year}-#{pallet.created_at.month}-#{pallet.created_at.day}"
                    temp <<  [[fecha] , [pallet.quantity]]
                 end

                 @datos = PackGroupReceipt.find(:all,
                    :select => 'pack_group_receipts.created_at, pack_group_receipts.quantity',
                    :from => 'receipts, pack_group_receipts, producers, pack_types',
                    :conditions => ["producers.id=? and
                        producers.id = receipts.producer_id and
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
                        receipts.id=pack_group_receipts.receipt_id and
                        pack_types.id=? and 
                        pack_group_receipts.pack_type_id=pack_types.id",
                        @producer_id,@fecha_inicio, @fecha_termino, pack_type.id])

                 mtrxx << [pack_type, temp ]
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
 				:select => 'pallets.created_at, pallets.quantity',
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
    			fecha = "#{pallet.created_at.year}-#{pallet.created_at.month}-#{pallet.created_at.day}"
    			temp <<  [[fecha] , [pallet.quantity]]
    		 end

    		# INGRESO DE ENVASES POR PACK_GROUPS_RECEIPT
    		@datos = PackGroupReceipt.find(:all,
	    		:from => 'receipts, pack_group_receipts, producers, pack_types',
	    		:select => 'pack_group_receipts.created_at, pack_group_receipts.quantity',
	    	    :conditions => ["producers.id=? and
                    producers.id = receipts.producer_id and
                    receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
                    receipts.id=pack_group_receipts.receipt_id and
                    pack_types.id=? and 
                    pack_group_receipts.pack_type_id=pack_types.id",
                    @producer_id,@fecha_inicio, @fecha_termino, @pack_type_id])
            @datos.each do |pack_group_receipt|
                fecha = "#{pack_group_receipt.created_at.year}-#{pack_group_receipt.created_at.month}-#{pack_group_receipt.created_at.day}"
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
        @fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio}"

        @year_termino = params[:end_date4]['year']
        @mes_termino = params[:end_date4]['month']
        @dia_termino = params[:end_date4]['day']
        @fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino}"
        
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
                        pack_types.id=? and 
                        pallets.pack_type_id=pack_types.id",
                        @destination_id, pack_type.id])
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
                        pack_types.id=? and 
                        pack_group_dispatches.pack_type_id=pack_types.id",
                        @destination_id, pack_type.id])

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
                    pack_types.id=? and 
                    pallets.pack_type_id=pack_types.id",
                    @destination_id, @pack_type_id])
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
                    pack_types.id=? and 
                    pack_group_dispatches.pack_type_id=pack_types.id",
                    @destination_id, @pack_type_id])

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
    	pdf = Report5Pdf.new()
    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    end

    if @report_type=="6"
    	@producer = params[:Productores6]
    	puts "chemimare"
    	puts @producer
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
