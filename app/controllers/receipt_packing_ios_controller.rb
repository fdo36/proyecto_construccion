class ReceiptPackingIosController < ApplicationController
  # GET /receipt_packing_ios
  # GET /receipt_packing_ios.json
  def index
    @receipt_packing_ios = ReceiptPackingIo.all
    @packing_pallets = PackingPallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipt_packing_ios }
    end
  end

  # GET /receipt_packing_ios/1
  # GET /receipt_packing_ios/1.json
  def show
    @receipt_packing_io = ReceiptPackingIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipt_packing_io }
    end
  end

  # GET /receipt_packing_ios/new
  # GET /receipt_packing_ios/new.json
  def new
    @receipt_packing_io = ReceiptPackingIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receipt_packing_io }
    end
  end

  # GET /receipt_packing_ios/1/edit
  def edit
    @receipt_packing_io = ReceiptPackingIo.find(params[:id])
  end

  # POST /receipt_packing_ios
  # POST /receipt_packing_ios.json
  def create
    @receipt_packing_io = ReceiptPackingIo.new(params[:receipt_packing_io])

    respond_to do |format|
      if @receipt_packing_io.save
        format.html { redirect_to @receipt_packing_io, notice: 'Receipt packing io was successfully created.' }
        format.json { render json: @receipt_packing_io, status: :created, location: @receipt_packing_io }
      else
        format.html { render action: "new" }
        format.json { render json: @receipt_packing_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receipt_packing_ios/1
  # PUT /receipt_packing_ios/1.json
  def update
    @receipt_packing_io = ReceiptPackingIo.find(params[:id])

    respond_to do |format|
      if @receipt_packing_io.update_attributes(params[:receipt_packing_io])
        format.html { redirect_to @receipt_packing_io, notice: 'Receipt packing io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receipt_packing_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipt_packing_ios/1
  # DELETE /receipt_packing_ios/1.json
  def destroy
    @receipt_packing_io = ReceiptPackingIo.find(params[:id])
    @receipt_packing_io.destroy

    respond_to do |format|
      format.html { redirect_to receipt_packing_ios_url }
      format.json { head :no_content }
    end
  end
end
