class DestinationPackingsController < ApplicationController
  # GET /destination_packings
  # GET /destination_packings.json
  def index
    @destination_packings = DestinationPacking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destination_packings }
    end
  end

  # GET /destination_packings/1
  # GET /destination_packings/1.json
  def show
    @destination_packing = DestinationPacking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @destination_packing }
    end
  end

  # GET /destination_packings/new
  # GET /destination_packings/new.json
  def new
    @destination_packing = DestinationPacking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @destination_packing }
    end
  end

  # GET /destination_packings/1/edit
  def edit
    @destination_packing = DestinationPacking.find(params[:id])
  end

  # POST /destination_packings
  # POST /destination_packings.json
  def create
    @destination_packing = DestinationPacking.new(params[:destination_packing])
    @destination_packing.company_id = current_user.company_id
    respond_to do |format|
      if @destination_packing.save
        format.html { redirect_to @destination_packing, notice: 'El destino se ha creado correctamente.' }
        format.json { render json: @destination_packing, status: :created, location: @destination_packing }
      else
        format.html { render action: "new" }
        format.json { render json: @destination_packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /destination_packings/1
  # PUT /destination_packings/1.json
  def update
    @destination_packing = DestinationPacking.find(params[:id])

    respond_to do |format|
      if @destination_packing.update_attributes(params[:destination_packing])
        format.html { redirect_to @destination_packing, notice: 'EL destino se ha editado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @destination_packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destination_packings/1
  # DELETE /destination_packings/1.json
  def destroy
    @destination_packing = DestinationPacking.find(params[:id])
    @destination_packing.destroy

    respond_to do |format|
      format.html { redirect_to destination_packings_url }
      format.json { head :no_content }
    end
  end
end
