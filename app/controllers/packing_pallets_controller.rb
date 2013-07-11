class PackingPalletsController < ApplicationController
  # GET /packing_pallets
  # GET /packing_pallets.json
  def index
    @packing_pallets = PackingPallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packing_pallets }
    end
  end

  # GET /packing_pallets/1
  # GET /packing_pallets/1.json
  def show
    @packing_pallet = PackingPallet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packing_pallet }
    end
  end

  # GET /packing_pallets/new
  # GET /packing_pallets/new.json
  def new
    @packing_pallet = PackingPallet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packing_pallet }
    end
  end

  # GET /packing_pallets/1/edit
  def edit
    @packing_pallet = PackingPallet.find(params[:id])
  end

  # POST /packing_pallets
  # POST /packing_pallets.json
  def create
    @packing_pallet = PackingPallet.new(params[:packing_pallet])

    respond_to do |format|
      if @packing_pallet.save
        format.html { redirect_to '/packing_pallets', notice: 'El Packing Pallet fue creado exitosamente.' }
        format.json { render json: @packing_pallet, status: :created, location: @packing_pallet }
      else
        format.html { render action: "new" }
        format.json { render json: @packing_pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packing_pallets/1
  # PUT /packing_pallets/1.json
  def update
    @packing_pallet = PackingPallet.find(params[:id])

    respond_to do |format|
      if @packing_pallet.update_attributes(params[:packing_pallet])
        format.html { redirect_to '/packing_pallets', notice: 'El Packing Pallet fue editado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @packing_pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packing_pallets/1
  # DELETE /packing_pallets/1.json
  def destroy
    @packing_pallet = PackingPallet.find(params[:id])
    @packing_pallet.destroy

    respond_to do |format|
      format.html { redirect_to packing_pallets_url }
      format.json { head :no_content }
    end
  end
end
