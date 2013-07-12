class FormatPackingsController < ApplicationController
  # GET /format_packings
  # GET /format_packings.json
  def index
    @format_packings = FormatPacking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @format_packings }
    end
  end

  # GET /format_packings/1
  # GET /format_packings/1.json
  def show
    @format_packing = FormatPacking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @format_packing }
    end
  end

  # GET /format_packings/new
  # GET /format_packings/new.json
  def new
    @format_packing = FormatPacking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @format_packing }
    end
  end

  # GET /format_packings/1/edit
  def edit
    @format_packing = FormatPacking.find(params[:id])
  end

  # POST /format_packings
  # POST /format_packings.json
  def create
    @format_packing = FormatPacking.new(params[:format_packing])
    @format_packing.company_id = current_user.company_id
    respond_to do |format|
      if @format_packing.save
        format.html { redirect_to @format_packing, notice: 'El formato se ha creado correctamente.' }
        format.json { render json: @format_packing, status: :created, location: @format_packing }
      else
        format.html { render action: "new" }
        format.json { render json: @format_packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /format_packings/1
  # PUT /format_packings/1.json
  def update
    @format_packing = FormatPacking.find(params[:id])

    respond_to do |format|
      if @format_packing.update_attributes(params[:format_packing])
        format.html { redirect_to @format_packing, notice: 'El formato ha sido editado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @format_packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /format_packings/1
  # DELETE /format_packings/1.json
  def destroy
    @format_packing = FormatPacking.find(params[:id])
    @format_packing.destroy

    respond_to do |format|
      format.html { redirect_to format_packings_url }
      format.json { head :no_content }
    end
  end
end
