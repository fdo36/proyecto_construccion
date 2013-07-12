class FinalPackingPalletsController < ApplicationController
  # GET /final_packing_pallets
  # GET /final_packing_pallets.json
  def index
    @final_packing_pallets = FinalPackingPallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @final_packing_pallets }
    end
  end

  # GET /final_packing_pallets/1
  # GET /final_packing_pallets/1.json
  def show
    @final_packing_pallet = FinalPackingPallet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @final_packing_pallet }
    end
  end

  # GET /final_packing_pallets/new
  # GET /final_packing_pallets/new.json
  def new
    @final_packing_pallet = FinalPackingPallet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @final_packing_pallet }
    end
  end

  # GET /final_packing_pallets/1/edit
  def edit
    @final_packing_pallet = FinalPackingPallet.find(params[:id])
  end

  # POST /final_packing_pallets
  # POST /final_packing_pallets.json
  def create
    @final_packing_pallet = FinalPackingPallet.new(params[:final_packing_pallet])
    @final_packing_pallet.company_id = current_user.company_id
    respond_to do |format|
      if @final_packing_pallet.save
        format.html { redirect_to @final_packing_pallet, notice: 'El Packing Pallet Final fue creado exitosamente.' }
        format.json { render json: @final_packing_pallet, status: :created, location: @final_packing_pallet }
      else
        format.html { render action: "new" }
        format.json { render json: @final_packing_pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /final_packing_pallets/1
  # PUT /final_packing_pallets/1.json
  def update
    @final_packing_pallet = FinalPackingPallet.find(params[:id])

    respond_to do |format|
      if @final_packing_pallet.update_attributes(params[:final_packing_pallet])
        format.html { redirect_to @final_packing_pallet, notice: 'El Packing Pallet Final fue editado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @final_packing_pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /final_packing_pallets/1
  # DELETE /final_packing_pallets/1.json
  def destroy
    @final_packing_pallet = FinalPackingPallet.find(params[:id])
    @final_packing_pallet.destroy

    respond_to do |format|
      format.html { redirect_to final_packing_pallets_url }
      format.json { head :no_content }
    end
  end
end
