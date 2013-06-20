class ProductionProcessIosController < ApplicationController
  # GET /production_process_ios
  # GET /production_process_ios.json
  def index
    @production_process_ios = ProductionProcessIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_process_ios }
    end
  end

  # GET /production_process_ios/1
  # GET /production_process_ios/1.json
  def show
    @production_process_io = ProductionProcessIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production_process_io }
    end
  end

  # GET /production_process_ios/new
  # GET /production_process_ios/new.json
  def new
    @production_process_io = ProductionProcessIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production_process_io }
    end
  end

  # GET /production_process_ios/1/edit
  def edit
    @production_process_io = ProductionProcessIo.find(params[:id])
  end

  # POST /production_process_ios
  # POST /production_process_ios.json
  def create
    @production_process_io = ProductionProcessIo.new(params[:production_process_io])

    respond_to do |format|
      if @production_process_io.save
        format.html { redirect_to @production_process_io, notice: 'Production process io was successfully created.' }
        format.json { render json: @production_process_io, status: :created, location: @production_process_io }
      else
        format.html { render action: "new" }
        format.json { render json: @production_process_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /production_process_ios/1
  # PUT /production_process_ios/1.json
  def update
    @production_process_io = ProductionProcessIo.find(params[:id])

    respond_to do |format|
      if @production_process_io.update_attributes(params[:production_process_io])
        format.html { redirect_to @production_process_io, notice: 'Production process io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production_process_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_process_ios/1
  # DELETE /production_process_ios/1.json
  def destroy
    @production_process_io = ProductionProcessIo.find(params[:id])
    @production_process_io.destroy

    respond_to do |format|
      format.html { redirect_to production_process_ios_url }
      format.json { head :no_content }
    end
  end
end
