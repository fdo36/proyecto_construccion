class PackingReportsController < ApplicationController
  def index
  end

	def create
   	@report_type = params[:report_type]

	  if @report_type=="1"
                        producers.id = receipts.producer_id and
  		@producer_id = params[:Productores1]
      if @producer_id == ""
          redirect_to packing_reports_path
          return
      end
      @packType_id = params[:EnvasePacking]

      @year_inicio = params[:start_date1]['year']
      @mes_inicio = params[:start_date1]['month']
      @dia_inicio = params[:start_date1]['day']
      @fecha_inicio = "#{@year_inicio}-#{@mes_inicio}-#{@dia_inicio}"

      @year_termino = params[:end_date1]['year']
      @mes_termino = params[:end_date1]['month']
      @dia_termino = params[:end_date1]['day']
      @fecha_termino = "#{@year_termino}-#{@mes_termino}-#{@dia_termino}"

      @producer = Producer.find(@producer_id)

      if @packType_id == ""
      	#PARA TODOS LOS ENVASES ASOCIADOS AL PRODUCTOR
      	@packTypes = PackType.all

      	#SALIDA DE ENVASES POR PRESTAMOS
        #
        # # # # # # # # # # #

        #INGRESO DE ENVASES POR PALLETS
        @pack_types.each do |pack_type|
          @datos = Pallet.find(:all,
  		      :select => 'receipts.receipt_datetime, pallets.quantity',
            :from => 'receipts, pallets, producers, pack_types',
            :conditions => ["producers.id=? and
                receipts.receipt_datetime >= ? and receipts.receipt_datetime <= ? and 
                receipts.id=pallets.receipt_id and
                pack_types.id=? and 
                pallets.pack_type_id=pack_types.id",
                @producer_id,@fecha_inicio, @fecha_termino, pack_type.id])
          temp = []
          @datos.each do |pallet|
          	row = []
          	row << dato.receipt_datetime.strftime("%d/%m/%Y")
          	row << pallet.quantity
          	temp << row
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
            row = []
          	row << dato.receipt_datetime.strftime("%d/%m/%Y")
          	row << pallet.quantity
          	temp << row
        	end

        	mtrxx << [pack_type, temp]
  			end
  			pdf = Report3Pdf.new(@producer, mtrxx, view_context)
  			send_data pdf.render,
    			type: "application/pdf",
    			disposition: "inline"
      
  		else
  			# TIPO DE ENVASE ESPECIFICO
  		end

  	end

  	if @report_type=="2"

  	end

	end
end
