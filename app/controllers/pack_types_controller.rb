class PackTypesController < ApplicationController
  # GET /pack_types
  # GET /pack_types.json
  def index
    @pack_types = PackType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pack_types }
    end
  end

  # GET /pack_types/1
  # GET /pack_types/1.json
  def show
    @pack_type = PackType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pack_type }
    end
  end

  # GET /pack_types/new
  # GET /pack_types/new.json
  def new
    @pack_type = PackType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pack_type }
    end
  end

  # GET /pack_types/1/edit
  def edit
    @pack_type = PackType.find(params[:id])
  end

  # POST /pack_types
  # POST /pack_types.json
  def create
    @pack_type = PackType.new(params[:pack_type])

    respond_to do |format|
      if @pack_type.save
        format.html { redirect_to @pack_type, notice: 'Pack type was successfully created.' }
        format.json { render json: @pack_type, status: :created, location: @pack_type }
      else
        format.html { render action: "new" }
        format.json { render json: @pack_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pack_types/1
  # PUT /pack_types/1.json
  def update
    @pack_type = PackType.find(params[:id])

    respond_to do |format|
      if @pack_type.update_attributes(params[:pack_type])
        format.html { redirect_to @pack_type, notice: 'Pack type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pack_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pack_types/1
  # DELETE /pack_types/1.json
  def destroy
    @pack_type = PackType.find(params[:id])
    @pack_type.destroy

    respond_to do |format|
      format.html { redirect_to pack_types_url }
      format.json { head :no_content }
    end
  end
end
