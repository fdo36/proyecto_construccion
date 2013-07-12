class DestinationPortsController < ApplicationController
  # GET /destination_ports
  # GET /destination_ports.json
  def index
    @destination_ports = DestinationPort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @destination_ports }
    end
  end

  # GET /destination_ports/1
  # GET /destination_ports/1.json
  def show
    @destination_port = DestinationPort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @destination_port }
    end
  end

  # GET /destination_ports/new
  # GET /destination_ports/new.json
  def new
    @destination_port = DestinationPort.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @destination_port }
    end
  end

  # GET /destination_ports/1/edit
  def edit
    @destination_port = DestinationPort.find(params[:id])
  end

  # POST /destination_ports
  # POST /destination_ports.json
  def create
    @destination_port = DestinationPort.new(params[:destination_port])
    @destination_port.company_id = current_user.company_id
    respond_to do |format|
      if @destination_port.save
        format.html { redirect_to @destination_port, notice: 'Destination port was successfully created.' }
        format.json { render json: @destination_port, status: :created, location: @destination_port }
      else
        format.html { render action: "new" }
        format.json { render json: @destination_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /destination_ports/1
  # PUT /destination_ports/1.json
  def update
    @destination_port = DestinationPort.find(params[:id])

    respond_to do |format|
      if @destination_port.update_attributes(params[:destination_port])
        format.html { redirect_to @destination_port, notice: 'Destination port was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @destination_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destination_ports/1
  # DELETE /destination_ports/1.json
  def destroy
    @destination_port = DestinationPort.find(params[:id])
    @destination_port.destroy

    respond_to do |format|
      format.html { redirect_to destination_ports_url }
      format.json { head :no_content }
    end
  end
end
