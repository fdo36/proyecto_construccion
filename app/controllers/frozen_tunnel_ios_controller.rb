#encoding: utf-8
class FrozenTunnelIosController < ApplicationController
  # GET /frozen_tunnel_ios
  # GET /frozen_tunnel_ios.json
  def index
    @frozen_tunnel_ios = FrozenTunnelIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frozen_tunnel_ios }
    end
  end

  # GET /frozen_tunnel_ios/1
  # GET /frozen_tunnel_ios/1.json
  def show
    @frozen_tunnel_io = FrozenTunnelIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frozen_tunnel_io }
    end
  end

  # GET /frozen_tunnel_ios/new
  # GET /frozen_tunnel_ios/new.json
  def new
    @frozen_tunnel_io = FrozenTunnelIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @frozen_tunnel_io }
    end
  end

  # GET /frozen_tunnel_ios/1/edit
  def edit
    @frozen_tunnel_io = FrozenTunnelIo.find(params[:id])
  end

  # POST /frozen_tunnel_ios
  # POST /frozen_tunnel_ios.json
  def create
    @frozen_tunnel_io = FrozenTunnelIo.new(params[:frozen_tunnel_io])

    respond_to do |format|
      if @frozen_tunnel_io.save
        format.html { redirect_to @frozen_tunnel_io, notice: 'Frozen tunnel io was successfully created.' }
        format.json { render json: @frozen_tunnel_io, status: :created, location: @frozen_tunnel_io }
      else
        format.html { render action: "new" }
        format.json { render json: @frozen_tunnel_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /frozen_tunnel_ios/1
  # PUT /frozen_tunnel_ios/1.json
  def update
    @frozen_tunnel_io = FrozenTunnelIo.find(params[:id])

    respond_to do |format|
      if @frozen_tunnel_io.update_attributes(params[:frozen_tunnel_io])
        format.html { redirect_to @frozen_tunnel_io, notice: 'Frozen tunnel io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @frozen_tunnel_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frozen_tunnel_ios/1
  # DELETE /frozen_tunnel_ios/1.json
  def destroy
    @frozen_tunnel_io = FrozenTunnelIo.find(params[:id])
    @frozen_tunnel_io.destroy

    respond_to do |format|
      format.html { redirect_to frozen_tunnel_ios_url }
      format.json { head :no_content }
    end
  end
end
