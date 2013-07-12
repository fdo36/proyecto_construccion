class DispatchesController < ApplicationController
  
  # GET /dispatches
  # GET /dispatches.json
  def index
    @dispatches = Dispatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dispatches }
    end
  end

  # GET /dispatches/1
  # GET /dispatches/1.json
  def show
    @dispatch = Dispatch.find(params[:id])

    @receipt = Receipt.find(params[:id])
    @destination = Destination.find(@dispatch.destination_id)
    @kind = Kind.find(@dispatch.kind_id)

    @pack = Receipt.find_by_sql "SELECT p.quantity as quantity, p.gross_weight as weight, p.price_per_unit as price,
          v.name as vName, q.name as qName, pt.tare as tare
          FROM pack_group_receipts as p, qualities as q, varieties as v , pack_types as pt
          WHERE p.receipt_id = #{@receipt.id} and
                p.quality_id = q.id and 
                p.variety_id = v.id and
                p.pack_type_id = pt.id"

    @pallets = Receipt.find_by_sql "
          SELECT p.created_at created, p.quantity as quantity, p.gross_weight as weight, p.price_per_unit as price,
          pt.tare as tare, pt.name as namePT,
          v.name as vName, q.name as qName 
          FROM pack_group_dispatches as p, qualities as q, varieties as v , pack_types as pt
          WHERE p.dispatch_id = #{@dispatch.id} and
                p.quality_id = q.id and 
                p.variety_id = v.id and
                p.pack_type_id = pt.id"
                
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dispatch }
      format.pdf { pdf = DispatchPdf.new(@dispatch, @destination, @kind,@pack,@pallets)
    send_data pdf.render,
    type: "application/pdf",
    disposition: "inline"}
    end
  end

  # GET /dispatches/new
  # GET /dispatches/new.json
  def new
    @dispatch = Dispatch.new
    @pallet = Pallet.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispatch }
    end
  end

  # GET /dispatches/1/edit
  def edit
    @dispatch = Dispatch.find(params[:id])
    @pallet = Pallet.new
  end

  # POST /dispatches
  # POST /dispatches.json
  def create
    @dispatch = Dispatch.new(params[:dispatch])
    @dispatch.company_id = current_user.company_id

    respond_to do |format|
      if @dispatch.save
        format.html { redirect_to @dispatch, notice: 'El despacho fue creado exitosamente.' }
        format.json { render json: @dispatch, status: :created, location: @dispatch }
      else
        format.html { render action: "new" }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispatches/1
  # PUT /dispatches/1.json
  def update
    @dispatch = Dispatch.find(params[:id])

    respond_to do |format|
      if @dispatch.update_attributes(params[:dispatch])
        format.html { redirect_to @dispatch, notice: 'El despacho fue editado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatches/1
  # DELETE /dispatches/1.json
  def destroy
    @dispatch = Dispatch.find(params[:id])
    @dispatch.destroy

    respond_to do |format|
      format.html { redirect_to dispatches_url }
      format.json { head :no_content }
    end
  end
end
