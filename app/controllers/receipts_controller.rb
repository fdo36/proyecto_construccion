#encoding: utf-8
class ReceiptsController < ApplicationController
  #load_and_authorize_resource

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipts }
    end
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
    @receipt = Receipt.find(params[:id])
    @pallet = Pallet.new
    @pack_group_receipt = PackGroupReceipt.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipt }
    end
  end

  # GET /receipts/new
  # GET /receipts/new.json
  def new
    @receipt = Receipt.new
    @pallet = Pallet.new
    @last_move=EmptyPacksProducerMove.find(:all, :order => "id desc", :limit => 1).reverse
    @code = @last_move.map{ |x| x.code }


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receipt }
    end
  end

  # GET /receipts/1/edit
  def edit
    @receipt = Receipt.find(params[:id])
    @pallet = Pallet.new
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = Receipt.new(params[:receipt])

    @receipt.company_id = current_user.company_id

    #Receipt.generate_pdf

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'El ingreso fue creado exitosamente.' }
        format.json { render json: @receipt, status: :created, location: @receipt }
      else
        format.html { render action: "new" }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receipts/1
  # PUT /receipts/1.json
  def update
    @receipt = Receipt.find(params[:id])

    respond_to do |format|
      if @receipt.update_attributes(params[:receipt])
        format.html { redirect_to @receipt, notice: 'El ingreso fue editado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_url }
      format.json { head :no_content }
    end
  end

  def generate_pdf

    #Aca va algo como:
    #@producer_id = params[:<Aca depende de como se llame el id del input en la vista de receipts>]
    #@producer = Producer.find(@producer_id)
    #Ahora ya tienes el productor y puedes hacer
    #@producer.id o  @producer.name etc

    pdf = Report8Pdf.new(view_context) # pdf = Report8Pdf.new(@producer, view_context)
    send_data pdf.render,
    type: "application/pdf",
    disposition: "inline"
  end

  def valid_kinds
    @producer_kinds = Producer.find(params[:id]).kinds
    @active_seasons = Season.where(:is_active => 1)
    @active_kinds = @active_seasons.map {|k| Kind.find(k.kind_id)}

    @valid_kinds = @active_kinds + @producer_kinds
    @valid_kinds = @valid_kinds.group_by{|vk| vk}.select{|k,v| v.size > 1}.keys

    respond_to do |format|
      format.json { render json: @valid_kinds}
    end
  end
end
