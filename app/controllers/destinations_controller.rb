#encoding: utf-8
class DestinationsController < ApplicationController
  load_and_authorize_resource
  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    @destination = Destination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @destination }
    end
  end

  # GET /destinations/new
  # GET /destinations/new.json
  def new
    @destination = Destination.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @destination }
    end
  end

  # GET /destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])
    @editing = true
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(params[:destination])
    @destination.update_attributes(:active => "1", :is_deleted => "0")

    @destination.company_id = current_user.company_id

    respond_to do |format|
      if @destination.save
        format.html { redirect_to destinations_path, notice: "El destino #{@destination.name} fue creado exitosamente." }
        format.json { render json: @destination, status: :created, location: @destination }
      else
        format.html { render action: "new" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /destinations/1
  # PUT /destinations/1.json
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.html { redirect_to destinations_path, notice: "El destino #{@destination.name} fue editado exitosamente." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination = Destination.find(params[:id])

    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end

  def disable
    @destination = Destination.find(params[:id])
    @destination.update_attribute(:active, "0")

    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end

  def enable
    @destination = Destination.find(params[:id])
    @destination.update_attribute(:active, "1")
    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end

  def delete_destination
    @destination = Destination.find(params[:id])
    @destination.update_attribute(:is_delete, "1")
    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end
end
