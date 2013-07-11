class PackingReportsController < ApplicationController
  def index
  end

	def create
   	@report_type = params[:report_type]

	  if @report_type=="1"
      
  		@producer_id = params[:Productores1]
      if @producer_id == ""
          redirect_to packing_reports_path
          return
      end
      @packType_id = params[:EnvasePacking]

      @year_inicio = params[:start_date1]['year']
      @mes_inicio = params[:start_date1]['month']
      @dia_inicio = params[:start_date1]['day']
      @fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio} 00:00:00"

      @year_termino = params[:end_date1]['year']
      @mes_termino = params[:end_date1]['month']
      @dia_termino = params[:end_date1]['day']
      @fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino} 23:59:59"


      @producer = Producer.find(@producer_id)

      if @packType_id == ""
        mtrxx = []
      	#PARA TODOS LOS ENVASES ASOCIADOS AL PRODUCTOR
      	@packTypes = PackType.all
        @packTypes.each do |pack_type|
          temp = []
          # movimiento de envases vacíos
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
            row = []
            row << move.created_at.strftime("%d/%m/%Y")
            if move.pack_option == "despacho"
              row << move.quantity * -1
            else
              row << move.quantity
            end
            temp << row
          end

          #movimiento de envases con fruta
          @datos = PackingPallet.find(:all,
  		      :from => 'receipt_packing_ios, packing_pallets, pack_types',
            :select => 'receipt_packing_ios.receipt_packing_io_datetime,
                        packing_pallets.quantity',
            :conditions => ["receipt_packing_ios.producer_id = ?  and
                receipt_packing_ios.receipt_packing_io_datetime >= ? and 
                receipt_packing_ios.receipt_packing_io_datetime <= ? and 
                receipt_packing_ios.id = packing_pallets.receipt_packing_io_id and
                pack_types.id=? and 
                packing_pallets.pack_type_id = pack_types.id",
                @producer_id,@fecha_inicio, @fecha_termino, pack_type.id])
          
          @datos.each do |dato|
          	row = []
          	row << dato.receipt_packing_io_datetime[0, 10]
          	row << dato.quantity
          	temp << row
        	end
          mtrxx << [pack_type, temp]
  			end

  			pdf = Report8Pdf.new(@producer, mtrxx, view_context)
  			send_data pdf.render,
    			type: "application/pdf",
    			disposition: "inline"
      
  		else
  			@pack_type = PackType.find(@packType_id)
        mtrxx = []
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
              @producer_id, @fecha_inicio, @fecha_termino, @packType_id])

        @moves.each do |move|
          row = []
          row << move.created_at.strftime("%d/%m/%Y")
          if move.pack_option == "despacho"
            row << move.quantity * -1
          else
            row << move.quantity
          end
          temp << row
        end

        #movimiento de envases con fruta
        @datos = PackingPallet.find(:all,
          :from => 'receipt_packing_ios, packing_pallets, pack_types',
          :select => 'receipt_packing_ios.receipt_packing_io_datetime,
                      packing_pallets.quantity',
          :conditions => ["receipt_packing_ios.producer_id = ?  and
              receipt_packing_ios.receipt_packing_io_datetime >= ? and 
              receipt_packing_ios.receipt_packing_io_datetime <= ? and 
              receipt_packing_ios.id = packing_pallets.receipt_packing_io_id and
              pack_types.id=? and 
              packing_pallets.pack_type_id = pack_types.id",
              @producer_id,@fecha_inicio, @fecha_termino, @packType_id])
        
        @datos.each do |dato|
          row = []
          row << dato.receipt_packing_io_datetime[0, 10]
          row << dato.quantity
          temp << row
        end
        mtrxx << [@pack_type, temp]
      end

      pdf = Report8Pdf.new(@producer, mtrxx, view_context)
      send_data pdf.render,
        type: "application/pdf",
        disposition: "inline"
  	end

  	if @report_type=="2"

  	end

	end
end
