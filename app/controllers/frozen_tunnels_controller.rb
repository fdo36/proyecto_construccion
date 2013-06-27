#encoding: utf-8
class FrozenTunnelsController < ApplicationController
  # GET /frozen_tunnels
  # GET /frozen_tunnels.json
  def index
    @frozen_tunnels = FrozenTunnel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frozen_tunnels }
    end
  end

  # GET /frozen_tunnels/1
  # GET /frozen_tunnels/1.json
  def show
    @frozen_tunnel = FrozenTunnel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frozen_tunnel }
    end
  end

  # GET /frozen_tunnels/new
  # GET /frozen_tunnels/new.json
  def new
    @frozen_tunnel = FrozenTunnel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @frozen_tunnel }
    end
  end

  # GET /frozen_tunnels/1/edit
  def edit
    @frozen_tunnel = FrozenTunnel.find(params[:id])
  end

  # POST /frozen_tunnels
  # POST /frozen_tunnels.json
  def create
    @frozen_tunnel = FrozenTunnel.new(params[:frozen_tunnel])

    respond_to do |format|
      if @frozen_tunnel.save
        format.html { redirect_to @frozen_tunnel, notice: 'Frozen tunnel was successfully created.' }
        format.json { render json: @frozen_tunnel, status: :created, location: @frozen_tunnel }
      else
        format.html { render action: "new" }
        format.json { render json: @frozen_tunnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /frozen_tunnels/1
  # PUT /frozen_tunnels/1.json
  def update
    @frozen_tunnel = FrozenTunnel.find(params[:id])

    respond_to do |format|
      if @frozen_tunnel.update_attributes(params[:frozen_tunnel])
        format.html { redirect_to @frozen_tunnel, notice: 'Frozen tunnel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @frozen_tunnel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frozen_tunnels/1
  # DELETE /frozen_tunnels/1.json
  def destroy
    @frozen_tunnel = FrozenTunnel.find(params[:id])
    @frozen_tunnel.destroy

    respond_to do |format|
      format.html { redirect_to frozen_tunnels_url }
      format.json { head :no_content }
    end
  end
end
