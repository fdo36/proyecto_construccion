class SuppliesReturnsController < ApplicationController
  # GET /supplies_returns
  # GET /supplies_returns.json
  def index
    @supplies_returns = SuppliesReturn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplies_returns }
    end
  end

  # GET /supplies_returns/1
  # GET /supplies_returns/1.json
  def show
    @supplies_return = SuppliesReturn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplies_return }
    end
  end

  # GET /supplies_returns/new
  # GET /supplies_returns/new.json
  def new
    @supplies_return = SuppliesReturn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplies_return }
    end
  end

  # GET /supplies_returns/1/edit
  def edit
    @supplies_return = SuppliesReturn.find(params[:id])
  end

  # POST /supplies_returns
  # POST /supplies_returns.json
  def create
    @supplies_return = SuppliesReturn.new(params[:supplies_return])
    @supply = Supply.find(@supplies_return.supply_id)
    @supply.stock_ini += @supplies_return.quantity

    respond_to do |format|
      if @supplies_return.save
        @supply.save
        format.html { redirect_to @supplies_return, notice: 'Supplies return was successfully created.' }
        format.json { render json: @supplies_return, status: :created, location: @supplies_return }
      else
        format.html { render action: "new" }
        format.json { render json: @supplies_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplies_returns/1
  # PUT /supplies_returns/1.json
  def update
    @supplies_return = SuppliesReturn.find(params[:id])

    respond_to do |format|
      if @supplies_return.update_attributes(params[:supplies_return])
        format.html { redirect_to @supplies_return, notice: 'Supplies return was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplies_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies_returns/1
  # DELETE /supplies_returns/1.json
  def destroy
    @supplies_return = SuppliesReturn.find(params[:id])
    @supplies_return.destroy

    respond_to do |format|
      format.html { redirect_to supplies_returns_url }
      format.json { head :no_content }
    end
  end
end
