class PalletsController < ApplicationController
  # GET /pallets
  # GET /pallets.json
  def index
    @pallets = Pallet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pallets }
    end
  end

  # GET /pallets/1
  # GET /pallets/1.json
  def show
    @pallet = Pallet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pallet }
    end
  end

  # GET /pallets/new
  # GET /pallets/new.json
  def new
    @pallet = Pallet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pallet }
    end
  end

  # GET /pallets/1/edit
  def edit
    @pallet = Pallet.find(params[:id])
  end

  # POST /pallets
  # POST /pallets.json
  def create
    @pallet = Pallet.new(params[:pallet])

    respond_to do |format|
      if @pallet.save
        format.html { redirect_to :back }
        format.json { render json: @pallet, status: :created, location: @pallet }
      else
        format.html { render action: "new" }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pallets/1
  # PUT /pallets/1.json
  def update
    @pallet = Pallet.find(params[:id])

    respond_to do |format|
      if @pallet.update_attributes(params[:pallet])
        format.html { redirect_to @pallet, notice: 'Pallet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pallets/1
  # DELETE /pallets/1.json
  def destroy
    @pallet = Pallet.find(params[:id])
    @pallet.destroy

    respond_to do |format|
      format.html { redirect_to pallets_url }
      format.json { head :no_content }
    end
  end
end
