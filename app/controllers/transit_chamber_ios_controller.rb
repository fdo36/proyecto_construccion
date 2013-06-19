class TransitChamberIosController < ApplicationController
  # GET /transit_chamber_ios
  # GET /transit_chamber_ios.json
  def index
    @transit_chamber_ios = TransitChamberIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transit_chamber_ios }
    end
  end

  # GET /transit_chamber_ios/1
  # GET /transit_chamber_ios/1.json
  def show
    @transit_chamber_io = TransitChamberIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transit_chamber_io }
    end
  end

  # GET /transit_chamber_ios/new
  # GET /transit_chamber_ios/new.json
  def new
    @transit_chamber_io = TransitChamberIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transit_chamber_io }
    end
  end

  # GET /transit_chamber_ios/1/edit
  def edit
    @transit_chamber_io = TransitChamberIo.find(params[:id])
  end

  # POST /transit_chamber_ios
  # POST /transit_chamber_ios.json
  def create
    @transit_chamber_io = TransitChamberIo.new(params[:transit_chamber_io])

    respond_to do |format|
      if @transit_chamber_io.save
        format.html { redirect_to @transit_chamber_io, notice: 'Transit chamber io was successfully created.' }
        format.json { render json: @transit_chamber_io, status: :created, location: @transit_chamber_io }
      else
        format.html { render action: "new" }
        format.json { render json: @transit_chamber_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transit_chamber_ios/1
  # PUT /transit_chamber_ios/1.json
  def update
    @transit_chamber_io = TransitChamberIo.find(params[:id])

    respond_to do |format|
      if @transit_chamber_io.update_attributes(params[:transit_chamber_io])
        format.html { redirect_to @transit_chamber_io, notice: 'Transit chamber io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transit_chamber_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transit_chamber_ios/1
  # DELETE /transit_chamber_ios/1.json
  def destroy
    @transit_chamber_io = TransitChamberIo.find(params[:id])
    @transit_chamber_io.destroy

    respond_to do |format|
      format.html { redirect_to transit_chamber_ios_url }
      format.json { head :no_content }
    end
  end
end
