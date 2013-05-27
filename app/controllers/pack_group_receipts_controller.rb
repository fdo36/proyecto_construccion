class PackGroupReceiptsController < ApplicationController
  # GET /pack_group_receipts
  # GET /pack_group_receipts.json
  def index
    @pack_group_receipts = PackGroupReceipt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pack_group_receipts }
    end
  end

  # GET /pack_group_receipts/1
  # GET /pack_group_receipts/1.json
  def show
    @pack_group_receipt = PackGroupReceipt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pack_group_receipt }
    end
  end

  # GET /pack_group_receipts/new
  # GET /pack_group_receipts/new.json
  def new
    @pack_group_receipt = PackGroupReceipt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pack_group_receipt }
    end
  end

  # GET /pack_group_receipts/1/edit
  def edit
    @pack_group_receipt = PackGroupReceipt.find(params[:id])
  end

  # POST /pack_group_receipts
  # POST /pack_group_receipts.json
  def create
    @pack_group_receipt = PackGroupReceipt.new(params[:pack_group_receipt])

    respond_to do |format|
      if @pack_group_receipt.save
        format.html { redirect_to @pack_group_receipt, notice: 'Pack group receipt was successfully created.' }
        format.json { render json: @pack_group_receipt, status: :created, location: @pack_group_receipt }
      else
        format.html { render action: "new" }
        format.json { render json: @pack_group_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pack_group_receipts/1
  # PUT /pack_group_receipts/1.json
  def update
    @pack_group_receipt = PackGroupReceipt.find(params[:id])

    respond_to do |format|
      if @pack_group_receipt.update_attributes(params[:pack_group_receipt])
        format.html { redirect_to @pack_group_receipt, notice: 'Pack group receipt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pack_group_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pack_group_receipts/1
  # DELETE /pack_group_receipts/1.json
  def destroy
    @pack_group_receipt = PackGroupReceipt.find(params[:id])
    @pack_group_receipt.destroy

    respond_to do |format|
      format.html { redirect_to pack_group_receipts_url }
      format.json { head :no_content }
    end
  end
end
