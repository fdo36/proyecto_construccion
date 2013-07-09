class ChargingOrdersController < ApplicationController
  # GET /charging_orders
  # GET /charging_orders.json
  def index
    @charging_orders = ChargingOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charging_orders }
    end
  end

  # GET /charging_orders/1
  # GET /charging_orders/1.json
  def show
    @charging_order = ChargingOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @charging_order }
    end
  end

  # GET /charging_orders/new
  # GET /charging_orders/new.json
  def new
    @charging_order = ChargingOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charging_order }
    end
  end

  # GET /charging_orders/1/edit
  def edit
    @charging_order = ChargingOrder.find(params[:id])
  end

  # POST /charging_orders
  # POST /charging_orders.json
  def create
    @charging_order = ChargingOrder.new(params[:charging_order])

    respond_to do |format|
      if @charging_order.save
        format.html { redirect_to @charging_order, notice: 'Charging order was successfully created.' }
        format.json { render json: @charging_order, status: :created, location: @charging_order }
      else
        format.html { render action: "new" }
        format.json { render json: @charging_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /charging_orders/1
  # PUT /charging_orders/1.json
  def update
    @charging_order = ChargingOrder.find(params[:id])

    respond_to do |format|
      if @charging_order.update_attributes(params[:charging_order])
        format.html { redirect_to @charging_order, notice: 'Charging order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charging_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charging_orders/1
  # DELETE /charging_orders/1.json
  def destroy
    @charging_order = ChargingOrder.find(params[:id])
    @charging_order.destroy

    respond_to do |format|
      format.html { redirect_to charging_orders_url }
      format.json { head :no_content }
    end
  end
end
