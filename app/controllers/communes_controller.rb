class CommunesController < ApplicationController
  # GET /communes
  # GET /communes.json
  def index
    @communes = Commune.where(:region_id => params[:region_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @communes }
    end
  end

  # GET /communes/1
  # GET /communes/1.json
  def show
    @commune = Commune.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commune }
    end
  end

  # GET /communes/new
  # GET /communes/new.json
  def new
    @commune = Commune.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commune }
    end
  end

  # GET /communes/1/edit
  def edit
    @commune = Commune.find(params[:id])
  end

  # POST /communes
  # POST /communes.json
  def create
    @commune = Commune.new(params[:commune])

    respond_to do |format|
      if @commune.save
        format.html { redirect_to @commune, notice: 'Commune was successfully created.' }
        format.json { render json: @commune, status: :created, location: @commune }
      else
        format.html { render action: "new" }
        format.json { render json: @commune.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /communes/1
  # PUT /communes/1.json
  def update
    @commune = Commune.find(params[:id])

    respond_to do |format|
      if @commune.update_attributes(params[:commune])
        format.html { redirect_to @commune, notice: 'Commune was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communes/1
  # DELETE /communes/1.json
  def destroy
    @commune = Commune.find(params[:id])
    @commune.destroy

    respond_to do |format|
      format.html { redirect_to communes_url }
      format.json { head :no_content }
    end
  end
end
