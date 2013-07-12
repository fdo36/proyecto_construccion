#encoding: utf-8
class TransitChamberIosController < ApplicationController
  #load_and_authorize_resource
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

    #@transit_chamber_ios.company_id = current_user.company_id
    #@transit_chamber_ios.system_type = current_user.system_type

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transit_chamber_io }
    end
  end

  
  def valid_pallets
    @previous_subprocess = SubprocessIo.where(:heir_type => "FrozenTunnelIo", :direction => false)
    @pallets_previous_subprocess = @previous_subprocess.map {|x| PackingPallet.find(x.packing_pallet_id)}
    
    @transit_chamber = SubprocessIo.where(:heir_type => "TransitChamberIo", :direction => true)
    @pallets_already_added = @transit_chamber.map {|x| PackingPallet.find(x.packing_pallet_id)}

    @valid_pallets = @pallets_previous_subprocess - @pallets_already_added      

    respond_to do |format|
      format.json {render json: @valid_pallets}
    end
  end

  def pallets_already_added
    @transit_chamber = SubprocessIo.where(:heir_type => "TransitChamberIo", :direction => true)
    @pallets_already_added = @transit_chamber.map {|x| PackingPallet.find(x.packing_pallet_id)}    

    respond_to do |format|
      format.json {render json: @pallets_already_added}
    end
  end

  # GET /transit_chamber_ios/new
  # GET /transit_chamber_ios/new.json
  def new
    @transit_chamber_io = TransitChamberIo.new
    @transit_chamber_io.io_datetime = DateTime.current();
    @current_user = current_user
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
    @transit_chamber_io.io_datetime = DateTime.current();
    @transit_chamber_io.direction = true
    
    respond_to do |format|
      if @transit_chamber_io.save
        @transit_chamber_io.order_number = @transit_chamber_io.id
        @transit_chamber_io.save
        format.html { redirect_to "/transit_chamber_ios", notice: 'La Cámara de Producto en Tránsito fue creada exitosamente.' }
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
        format.html { redirect_to "/transit_chamber_ios", notice: 'La Cámara de Producto en Tránsito fue editada exitosamente.' }
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
