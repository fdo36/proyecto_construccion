class StabilizationChamberIosController < ApplicationController
  # GET /stabilization_chamber_ios
  # GET /stabilization_chamber_ios.json
  def index
    @stabilization_chamber_ios = StabilizationChamberIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stabilization_chamber_ios }
    end
  end

  # GET /stabilization_chamber_ios/1
  # GET /stabilization_chamber_ios/1.json
  def show
    @stabilization_chamber_io = StabilizationChamberIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stabilization_chamber_io }
    end
  end

  # GET /stabilization_chamber_ios/new
  # GET /stabilization_chamber_ios/new.json
  def new
    @stabilization_chamber_io = StabilizationChamberIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stabilization_chamber_io }
    end
  end

  # GET /stabilization_chamber_ios/1/edit
  def edit
    @stabilization_chamber_io = StabilizationChamberIo.find(params[:id])
  end

  # POST /stabilization_chamber_ios
  # POST /stabilization_chamber_ios.json
  def create
    @stabilization_chamber_io = StabilizationChamberIo.new(params[:stabilization_chamber_io])

    respond_to do |format|
      if @stabilization_chamber_io.save
        format.html { redirect_to @stabilization_chamber_io, notice: 'Stabilization chamber io was successfully created.' }
        format.json { render json: @stabilization_chamber_io, status: :created, location: @stabilization_chamber_io }
      else
        format.html { render action: "new" }
        format.json { render json: @stabilization_chamber_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stabilization_chamber_ios/1
  # PUT /stabilization_chamber_ios/1.json
  def update
    @stabilization_chamber_io = StabilizationChamberIo.find(params[:id])

    respond_to do |format|
      if @stabilization_chamber_io.update_attributes(params[:stabilization_chamber_io])
        format.html { redirect_to @stabilization_chamber_io, notice: 'Stabilization chamber io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stabilization_chamber_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stabilization_chamber_ios/1
  # DELETE /stabilization_chamber_ios/1.json
  def destroy
    @stabilization_chamber_io = StabilizationChamberIo.find(params[:id])
    @stabilization_chamber_io.destroy

    respond_to do |format|
      format.html { redirect_to stabilization_chamber_ios_url }
      format.json { head :no_content }
    end
  end
end
