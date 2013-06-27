class TunnelsController < ApplicationController
  # GET /tunnels
  # GET /tunnels.json
  def index
    @tunnels = Tunnel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tunnels }
    end
  end

  # GET /tunnels/1
  # GET /tunnels/1.json
  def show
    @tunnel = Tunnel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tunnel }
    end
  end

  # GET /tunnels/new
  # GET /tunnels/new.json
  def new
    @tunnel = Tunnel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tunnel }
    end
  end

  # GET /tunnels/1/edit
  def edit
    @tunnel = Tunnel.find(params[:id])
  end

  # POST /tunnels
  # POST /tunnels.json
  def create
    @tunnel = Tunnel.new(params[:tunnel])

    respond_to do |format|
      if @tunnel.save
        format.html { redirect_to @tunnel, notice: 'Tunnel was successfully created.' }
        format.json { render json: @tunnel, status: :created, location: @tunnel }
      else
        format.html { render action: "new" }
        format.json { render json: @tunnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tunnels/1
  # PUT /tunnels/1.json
  def update
    @tunnel = Tunnel.find(params[:id])

    respond_to do |format|
      if @tunnel.update_attributes(params[:tunnel])
        format.html { redirect_to @tunnel, notice: 'Tunnel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tunnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunnels/1
  # DELETE /tunnels/1.json
  def destroy
    @tunnel = Tunnel.find(params[:id])
    @tunnel.destroy

    respond_to do |format|
      format.html { redirect_to tunnels_url }
      format.json { head :no_content }
    end
  end
end
