class PackPackingsController < ApplicationController
  # GET /pack_packings
  # GET /pack_packings.json
  def index
    @pack_packings = PackPacking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pack_packings }
    end
  end

  # GET /pack_packings/1
  # GET /pack_packings/1.json
  def show
    @pack_packing = PackPacking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pack_packing }
    end
  end

  # GET /pack_packings/new
  # GET /pack_packings/new.json
  def new
    @pack_packing = PackPacking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pack_packing }
    end
  end

  # GET /pack_packings/1/edit
  def edit
    @pack_packing = PackPacking.find(params[:id])
  end

  # POST /pack_packings
  # POST /pack_packings.json
  def create
    @pack_packing = PackPacking.new(params[:pack_packing])
    @pack_packing.company_id = current_user.company_id
    respond_to do |format|
      if @pack_packing.save
        format.html { redirect_to @pack_packing, notice: 'Pack packing fue creado exitosamente.' }
        format.json { render json: @pack_packing, status: :created, location: @pack_packing }
      else
        format.html { render action: "new" }
        format.json { render json: @pack_packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pack_packings/1
  # PUT /pack_packings/1.json
  def update
    @pack_packing = PackPacking.find(params[:id])

    respond_to do |format|
      if @pack_packing.update_attributes(params[:pack_packing])
        format.html { redirect_to @pack_packing, notice: 'Pack packing fue editado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pack_packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pack_packings/1
  # DELETE /pack_packings/1.json
  def destroy
    @pack_packing = PackPacking.find(params[:id])
    @pack_packing.destroy

    respond_to do |format|
      format.html { redirect_to pack_packings_url }
      format.json { head :no_content }
    end
  end
end
