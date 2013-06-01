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
    	pdf = Report3Pdf.new()
    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
    end

    if @report_type=="4"
    	pdf = Report4Pdf.new()
    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
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
		pdf = Report7Pdf.new()
    	send_data pdf.render,
	    	type: "application/pdf",
	    	disposition: "inline"
	end

    respond_to do |format|
    	format.html {}
  	end
	end
end
