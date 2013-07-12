class OriginPortsController < ApplicationController
  # GET /origin_ports
  # GET /origin_ports.json
  def index
    @origin_ports = OriginPort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @origin_ports }
    end
  end

  # GET /origin_ports/1
  # GET /origin_ports/1.json
  def show
    @origin_port = OriginPort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @origin_port }
    end
  end

  # GET /origin_ports/new
  # GET /origin_ports/new.json
  def new
    @origin_port = OriginPort.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @origin_port }
    end
  end

  # GET /origin_ports/1/edit
  def edit
    @origin_port = OriginPort.find(params[:id])
  end

  # POST /origin_ports
  # POST /origin_ports.json
  def create
    @origin_port = OriginPort.new(params[:origin_port])
    @origin_port.company_id = current_user.company_id
    respond_to do |format|
      if @origin_port.save
        format.html { redirect_to @origin_port, notice: 'Origin port was successfully created.' }
        format.json { render json: @origin_port, status: :created, location: @origin_port }
      else
        format.html { render action: "new" }
        format.json { render json: @origin_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /origin_ports/1
  # PUT /origin_ports/1.json
  def update
    @origin_port = OriginPort.find(params[:id])

    respond_to do |format|
      if @origin_port.update_attributes(params[:origin_port])
        format.html { redirect_to @origin_port, notice: 'Origin port was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @origin_port.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /origin_ports/1
  # DELETE /origin_ports/1.json
  def destroy
    @origin_port = OriginPort.find(params[:id])
    @origin_port.destroy

    respond_to do |format|
      format.html { redirect_to origin_ports_url }
      format.json { head :no_content }
    end
  end
end
