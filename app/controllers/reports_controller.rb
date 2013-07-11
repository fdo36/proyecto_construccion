class ReportsController < ApplicationController
  

  def index
  end

  def create
    @report_type = params[:report_type]

    if @report_type=="1"
    	@producer_id = params[:Productores1]
        if @producer_id == ""
            redirect_to reports_path
            return
        end
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

            #Solo para pallets
    		@kinds.each do |kind|
    			@ingresos = Receipt.find(:all,
	    		:from => 'receipts, varieties, qualities, pallets, producers',
	    		:select => 'receipts.id, receipts.receipt_datetime, varieties.name AS variety_name, qualities.name AS quality_name, pallets.price_per_unit',
	    		:conditions => ["producers.id=? and producers.id=receipts.producer_id and 
	    			receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
	    			receipts.kind_id=? and pallets.receipt_id
	    			=receipts.id and varieties.id=pallets.variety_id and qualities.id=pallets.quality_id",@producer_id, 
	    			@fecha_inicio, @fecha_termino, kind.id])
                if @ingresos.length==1
                    mtrxx << [kind, @ingresos]
                end
    		end

            #Para pack_group_receipt
            @kinds.each do |kind|
                @ingresos = Receipt.find(:all,
                :from => 'receipts, varieties, qualities, pack_group_receipts, producers',
                :select => 'receipts.id, receipts.receipt_datetime, varieties.name AS variety_name, qualities.name AS quality_name, pack_group_receipts.price_per_unit',
                :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                    receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                    receipts.kind_id=? and pack_group_receipts.receipt_id
                    =receipts.id and varieties.id=pack_group_receipts.variety_id and qualities.id=pack_group_receipts.quality_id",@producer_id, 
                    @fecha_inicio, @fecha_termino, kind.id])
                if @ingresos.length==1
                    mtrxx << [kind, @ingresos]
                end
            end

    		pdf = Report1Pdf.new(@producer, mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    	else
    		#especifico
    		@kind = Kind.find(@kind_id)
            mtrxx = []

            #Solo para pallets
    		@ingresos = Receipt.find(:all,
	    		:from => 'receipts, varieties, qualities, pallets, producers',
	    		:select => 'receipts.id, receipts.receipt_datetime, varieties.name AS variety_name, qualities.name AS quality_name, pallets.price_per_unit',
	    		:conditions => ["producers.id=? and producers.id=receipts.producer_id and 
	    			receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
	    			receipts.kind_id=? and pallets.receipt_id
	    			=receipts.id and varieties.id=pallets.variety_id and qualities.id=pallets.quality_id",@producer_id, 
	    			@fecha_inicio, @fecha_termino, @kind_id])
            if @ingresos.length==1
                mtrxx << [@kind, @ingresos]
            end

            #Para pack_group_receipt
            @ingresos = Receipt.find(:all,
                :from => 'receipts, varieties, qualities, pack_group_receipts, producers',
                :select => 'receipts.id, receipts.receipt_datetime, varieties.name AS variety_name, qualities.name AS quality_name, pack_group_receipts.price_per_unit',
                :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                    receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                    receipts.kind_id=? and pack_group_receipts.receipt_id
                    =receipts.id and varieties.id=pack_group_receipts.variety_id and qualities.id=pack_group_receipts.quality_id",@producer_id, 
                    @fecha_inicio, @fecha_termino, @kind_id])
            if @ingresos.length==1
                mtrxx << [@kind, @ingresos]
            end

    		pdf = Report1Pdf.new(@producer, mtrxx, view_context)
	    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    	end
    end

    if @report_type=="2"

        @producer_id = params[:Productores2]
        if @producer_id == ""
            redirect_to reports_path
            return
        end
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
                        :select => 'receipts.id, receipts.receipt_datetime, qualities.name, pallets.gross_weight ,pallets.price_per_unit',
                        :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                            receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                            receipts.kind_id=? and pallets.receipt_id
                            =receipts.id and pallets.variety_id=? and qualities.id=pallets.quality_id",@producer_id, 
                            @fecha_inicio, @fecha_termino, kind.id, variety.id])

                        temp = []
                        totalKGS = 0
                        totalPrice = 0
                        if @datos.length>0
                            @datos.each do |dato|
                                roww = []
                                roww << dato.id
                                roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                                roww << dato.name
                                roww << dato.gross_weight
                                roww << dato.price_per_unit
                                roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                                totalKGS = totalKGS + dato.gross_weight.to_f
                                totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                                temp << roww
                            end
                        end

                        @datos = Receipt.find(:all,
                        :from => 'receipts, qualities, pack_group_receipts, producers',
                        :select => 'receipts.id, receipts.receipt_datetime, qualities.name, pack_group_receipts.gross_weight ,pack_group_receipts.price_per_unit',
                        :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                            receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                            receipts.kind_id=? and pack_group_receipts.receipt_id
                            =receipts.id and pack_group_receipts.variety_id=? and qualities.id=pack_group_receipts.quality_id",@producer_id, 
                            @fecha_inicio, @fecha_termino, kind.id, variety.id])

                        if @datos.length>0
                            @datos.each do |dato|
                                roww = []
                                roww << dato.id
                                roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                                roww << dato.name
                                roww << dato.gross_weight
                                roww << dato.price_per_unit
                                roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                                totalKGS = totalKGS + dato.gross_weight.to_f
                                totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                                temp << roww
                            end
                        end
                        if temp.length>0
                            variety_receipts << [variety, temp, totalKGS, totalPrice]
                        end
                    end
                    if variety_receipts.length>0
                        kind_variety << [kind, variety_receipts]
                    end
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
                    :select => 'receipts.id, receipts.receipt_datetime, qualities.name, pallets.gross_weight ,pallets.price_per_unit',
                    :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                        receipts.kind_id=? and pallets.receipt_id
                        =receipts.id and pallets.variety_id=? and qualities.id=pallets.quality_id",@producer_id, 
                        @fecha_inicio, @fecha_termino, @kind_id, variety.id])

                    temp = []
                    totalKGS = 0
                    totalPrice = 0
                    if @datos.length>0
                        @datos.each do |dato|
                            roww = []
                            roww << dato.id
                            roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                            roww << dato.name
                            roww << dato.gross_weight
                            roww << dato.price_per_unit
                            roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            totalKGS = totalKGS + dato.gross_weight.to_f
                            totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            temp << roww
                        end
                    end

                    @datos = Receipt.find(:all,
                    :from => 'receipts, qualities, pack_group_receipts, producers',
                    :select => 'receipts.id, receipts.receipt_datetime, qualities.name, pack_group_receipts.gross_weight ,pack_group_receipts.price_per_unit',
                    :conditions => ["producers.id=? and producers.id=receipts.producer_id and 
                        receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and
                        receipts.kind_id=? and pack_group_receipts.receipt_id
                        =receipts.id and pack_group_receipts.variety_id=? and qualities.id=pack_group_receipts.quality_id",@producer_id, 
                        @fecha_inicio, @fecha_termino, @kind_id, variety.id])

                    if @datos.length>0
                        @datos.each do |dato|
                            roww = []
                            roww << dato.id
                            roww << dato.receipt_datetime.strftime("%d/%m/%Y")
                            roww << dato.name
                            roww << dato.gross_weight
                            roww << dato.price_per_unit
                            roww << (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            totalKGS = totalKGS + dato.gross_weight.to_f
                            totalPrice = totalPrice + (dato.price_per_unit.to_f * dato.gross_weight.to_f)
                            temp << roww
                        end
                    end
                    if temp.length>0
                        variety_receipts << [variety, temp, totalKGS, totalPrice]
                    end
                end

                if variety_receipts.length>0
                    kind_variety << [@kind, variety_receipts]
                end

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
        if @producer_id == ""
            redirect_to reports_path
            return
        end
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
            @pack_types.each do |pack_type|
                temp = []

                #SALIDA DE ENVASES POR PRESTAMOS
                @moves = EmptyPacksProducerMove.find(:all,
                :from => 'empty_packs_producer_moves, pack_types',
                :select =>'empty_packs_producer_moves.created_at, 
                           empty_packs_producer_moves.quantity,
                           empty_packs_producer_moves.pack_option',
                :conditions => ["empty_packs_producer_moves.producer_id=? and
                    empty_packs_producer_moves.created_at >= ? and
                    empty_packs_producer_moves.created_at <= ? and
                    pack_types.id = ? and
                    empty_packs_producer_moves.pack_type_id = pack_types.id",
                    @producer_id, @fecha_inicio, @fecha_termino, pack_type.id])

                @moves.each do |move|
                    fecha = move.created_at.strftime("%d/%m/%Y")
                    if move.pack_option == "despacho"
                      quantity = move.quantity * -1
                    else
                      quantity = move.quantity
                    end
                    temp << [[fecha],[quantity]]
                end

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
                        @producer_id,@fecha_inicio, @fecha_termino, pack_type.id])

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
            temp = []
    		@moves = EmptyPacksProducerMove.find(:all,
                :from => 'empty_packs_producer_moves, pack_types',
                :select =>'empty_packs_producer_moves.created_at, 
                           empty_packs_producer_moves.quantity,
                           empty_packs_producer_moves.pack_option',
                :conditions => ["empty_packs_producer_moves.producer_id=? and
                    empty_packs_producer_moves.created_at >= ? and
                    empty_packs_producer_moves.created_at <= ? and
                    pack_types.id = ? and
                    empty_packs_producer_moves.pack_type_id = pack_types.id",
                    @producer_id, @fecha_inicio, @fecha_termino, @pack_type_id])

            @moves.each do |move|
                fecha = move.created_at.strftime("%d/%m/%Y")
                if move.pack_option == "despacho"
                  quantity = move.quantity * -1
                else
                  quantity = move.quantity
                end
                temp << [[fecha],[quantity]]
            end
    		
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
            @datos.each do |pack|
               fecha = "#{pack.receipt_datetime.to_datetime.year}-#{pack.receipt_datetime.to_datetime.month}-#{pack.receipt_datetime.to_datetime.day}"
                temp <<  [[fecha] , [pack.quantity]]
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
        if @destination_id == ""
            redirect_to reports_path
            return
        end
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
            @pack_types.each do |pack_type|
                temp = []

            #INGRESO DE ENVASES POR DEVOLUCIONES DEL DESTINO
                @moves = EmptyPacksProducerMove.find(:all,
                    :from => 'empty_packs_destination_moves, pack_types',
                    :select =>'empty_packs_destination_moves.created_at, 
                               empty_packs_destination_moves.quantity,
                               empty_packs_destination_moves.pack_option',
                    :conditions => ["empty_packs_destination_moves.destination_id=? and
                        empty_packs_destination_moves.created_at >= ? and
                        empty_packs_destination_moves.created_at <= ? and
                        pack_types.id = ? and
                        empty_packs_destination_moves.pack_type_id = pack_types.id",
                        @destination_id, @fecha_inicio, @fecha_termino, pack_type.id])

                @moves.each do |move|
                    fecha = move.created_at.strftime("%d/%m/%Y")
                    if move.pack_option == "despacho"
                      quantity = move.quantity * -1
                    else
                      quantity = move.quantity
                    end
                    temp << [[fecha],[quantity]]
                end

            #INGRESO DE ENVASES POR DESPACHOS DE PALLETS
            
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
            temp = [] 

            #SALIDA DE ENVASES POR PRESTAMOS
            @moves = EmptyPacksProducerMove.find(:all,
                :from => 'empty_packs_destination_moves, pack_types',
                :select =>'empty_packs_destination_moves.created_at, 
                           empty_packs_destination_moves.quantity,
                           empty_packs_destination_moves.pack_option',
                :conditions => ["empty_packs_destination_moves.producer_id=? and
                    empty_packs_destination_moves.created_at >= ? and
                    empty_packs_destination_moves.created_at <= ? and
                    pack_types.id = ? and
                    empty_packs_destination_moves.pack_type_id = pack_types.id",
                    @destination_id, @fecha_inicio, @fecha_termino, @pack_type_id])

            @moves.each do |move|
                fecha = move.created_at.strftime("%d/%m/%Y")
                if move.pack_option == "despacho"
                  quantity = move.quantity * -1
                else
                  quantity = move.quantity
                end
                temp << [[fecha],[quantity]]
            end

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
        @destino_id = params[:Destinos5]
        if @destino_id == ""
            redirect_to reports_path
            return
        end
        @kind_id = params[:Especies5]

        @year_inicio = params[:start_date5]['year']
        @mes_inicio = params[:start_date5]['month']
        @dia_inicio = params[:start_date5]['day']
        @fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio}"

        @year_termino = params[:end_date5]['year']
        @mes_termino = params[:end_date5]['month']
        @dia_termino = params[:end_date5]['day']
        @fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino}"

        if @destino_id!=""
            #solo para uno
            if @kind_id==""
                #Para 1 destino todas las especies
                mtrxx = []
                @destino = Destination.find(@destino_id)
                @kinds = Kind.all
                kind_dispatch = []

                @kinds.each do |kind|
                    @datos = Dispatch.find(:all,
                    :from => 'dispatches, qualities, pallets, destinations, varieties, pack_types',
                    :select => 'dispatches.code, pallets.code, varieties.name, qualities.name, dispatches.dispatch_datetime, pack_types.name, pallets.quantity,
                                pallets.gross_weight, pallets.tare, pack_types.tare',
                    :conditions => ["destinations.id=? and destinations.id=dispatches.destination_id and 
                        dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and
                        dispatches.kind_id=? and pallets.dispatch_id=dispatches.id and 
                        pallets.variety_id=varieties.id and qualities.id=pallets.quality_id and 
                        pallets.pack_type_id=pack_types.id",@destino_id, 
                        @fecha_inicio, @fecha_termino, kind.id])

                    puts "algoooooooooooooooooooooooooooo"
                    puts @datos.length

                    temp = []
                    peso_neto = 0
                    @datos.each do |dato|
                        roww = []
                        roww << dato.dispatches.code
                        roww << dato.pallets.code
                        roww << dato.varieties.name
                        roww << dato.qualities.name
                        roww << dato.dispatch_datetime.strftime("%d/%m/%Y")
                        roww << dato.pack_type.name
                        roww << dato.quantity

                        #Calculando el peso neto
                        peso_neto = dato.gross_weight.to_f - dato.pallets.tare.to_f - (dato.pack_types.tare.to_f * dato.quantity.to_f)

                        roww <<peso_neto
                        temp << roww
                    end

                    @datos = Dispatch.find(:all,
                    :from => 'dispatches, qualities, pack_group_dispatches, destinations, varieties, pack_types',
                    :select => 'dispatches.code, pack_group_dispatches.id, varieties.name, qualities.name, dispatches.dispatch_datetime, pack_types.name, pack_group_dispatches.quantity,
                                pack_group_dispatches.gross_weight, pack_types.tare',
                    :conditions => ["destinations.id=? and destinations.id=dispatches.destination_id and 
                        dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and
                        dispatches.kind_id=? and pack_group_dispatches.dispatch_id=dispatches.id and 
                        pack_group_dispatches.variety_id=varieties.id and qualities.id=pack_group_dispatches.quality_id and 
                        pack_group_dispatches.pack_type_id=pack_types.id",@destino_id, 
                        @fecha_inicio, @fecha_termino, kind.id])

                    puts "algoooooooooooooooooooooooooooo"
                    puts @datos.length

                    peso_neto = 0
                    @datos.each do |dato|
                        roww = []
                        roww << dato.dispatches.id
                        roww << dato.pack_group_dispatches.code
                        roww << dato.varieties.name
                        roww << dato.qualities.name
                        roww << dato.dispatch_datetime.strftime("%d/%m/%Y")
                        roww << dato.pack_type.name
                        roww << dato.quantity

                        #Calculando el peso neto
                        peso_neto = dato.gross_weight.to_f - (dato.pack_types.tare.to_f * dato.quantity.to_f)

                        roww <<peso_neto
                        temp << roww
                    end
                    kind_dispatch << [kind, temp]
                end
                mtrxx << [@producer, kind_dispatch]

                pdf = Report5Pdf.new(mtrxx,view_context)
                send_data pdf.render,
                    type: "application/pdf",
                    disposition: "inline"
            else
                #Para 1 destino 1 especie
                mtrxx = []
                @destino = Destination.find(@destino_id)
                @kind = Kind.find(@kind_id)

                kind_dispatch = []

                #Para pallets
                @datos = Dispatch.find(:all,
                :from => 'dispatches, qualities, pallets, destinations, varieties, pack_types',
                :select => 'dispatches.code, pallets.code, varieties.name, qualities.name, dispatches.dispatch_datetime, pack_types.name, pallets.quantity,
                            pallets.gross_weight, pallets.tare, pack_types.tare',
                :conditions => ["destinations.id=? and destinations.id=dispatches.destination_id and 
                    dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and
                    dispatches.kind_id=? and pallets.dispatch_id=dispatches.id and 
                    pallets.variety_id=varieties.id and qualities.id=pallets.quality_id and 
                    pallets.pack_type_id=pack_types.id",@destino_id, 
                    @fecha_inicio, @fecha_termino, @kind_id])

                puts "algoooooooooooooooooooooooooooo"
                puts @datos.length

                temp = []
                peso_neto = 0
                @datos.each do |dato|
                    roww = []
                    roww << dato.dispatches.code
                    roww << dato.pallets.code
                    roww << dato.varieties.name
                    roww << dato.qualities.name
                    roww << dato.dispatch_datetime.strftime("%d/%m/%Y")
                    roww << dato.pack_type.name
                    roww << dato.quantity

                    #Calculando el peso neto
                    peso_neto = dato.gross_weight.to_f - dato.pallets.tare.to_f - (dato.pack_types.tare.to_f * dato.quantity.to_f)

                    roww <<peso_neto
                    temp << roww
                end

                @datos = Dispatch.find(:all,
                :from => 'dispatches, qualities, pack_group_dispatches, destinations, varieties, pack_types',
                :select => 'dispatches.code, pack_group_dispatches.id, varieties.name, qualities.name, dispatches.dispatch_datetime, pack_types.name, pack_group_dispatches.quantity,
                            pack_group_dispatches.gross_weight, pack_types.tare',
                :conditions => ["destinations.id=? and destinations.id=dispatches.destination_id and 
                    dispatches.dispatch_datetime >= ? and dispatches.dispatch_datetime <= ? and
                    dispatches.kind_id=? and pack_group_dispatches.dispatch_id=dispatches.id and 
                    pack_group_dispatches.variety_id=varieties.id and qualities.id=pack_group_dispatches.quality_id and 
                    pack_group_dispatches.pack_type_id=pack_types.id",@destino_id, 
                    @fecha_inicio, @fecha_termino, @kind_id])

                puts "algoooooooooooooooooooooooooooo"
                puts @datos.length

                peso_neto = 0
                @datos.each do |dato|
                    roww = []
                    roww << dato.dispatches.code
                    roww << dato.pack_group_dispatches.id
                    roww << dato.varieties.name
                    roww << dato.qualities.name
                    roww << dato.dispatch_datetime.strftime("%d/%m/%Y")
                    roww << dato.pack_type.name
                    roww << dato.quantity

                    #Calculando el peso neto
                    peso_neto = dato.gross_weight.to_f - (dato.pack_types.tare.to_f * dato.quantity.to_f)

                    roww <<peso_neto
                    temp << roww
                end

                kind_dispatch << [@kind, temp]

                mtrxx << [@producer, kind_dispatch]

                pdf = Report5Pdf.new(mtrxx,view_context)
                send_data pdf.render,
                    type: "application/pdf",
                    disposition: "inline"
            end
        end
    end

    if @report_type=="6"
    	@producer = params[:Productores6]
    	if @producer==""
    		mtrxx = []

	    	@producers = Producer.all

	    	@producers.each do |producer|
	    		@kinds = Kind.find(:all,
		    		:from => 'kinds, receipts',
		    		:select => 'kinds.id, kinds.name',
		    		:conditions => ["kinds.id = receipts.kind_id and
                                    receipts.producer_id = ?",
                                    producer.id])
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
	    		:from => 'kinds, receipts',
	    		:select => 'kinds.id, kinds.name',
	    		:conditions => ["kinds.id = receipts.kind_id and
                                 receipts.producer_id = ?",
                                 @producer])
	    	
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
