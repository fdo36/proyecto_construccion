class PalletFinishedProductsController < ApplicationController
  # GET /pallet_finished_products
  # GET /pallet_finished_products.json
  def index
    @pallet_finished_products = PalletFinishedProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pallet_finished_products }
    end
  end

  # GET /pallet_finished_products/1
  # GET /pallet_finished_products/1.json
  def show
    @pallet_finished_product = PalletFinishedProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pallet_finished_product }
    end
  end

  # GET /pallet_finished_products/new
  # GET /pallet_finished_products/new.json
  def new
    @pallet_finished_product = PalletFinishedProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pallet_finished_product }
    end
  end

  # GET /pallet_finished_products/1/edit
  def edit
    @pallet_finished_product = PalletFinishedProduct.find(params[:id])
  end

  # POST /pallet_finished_products
  # POST /pallet_finished_products.json
  def create
    @pallet_finished_product = PalletFinishedProduct.new(params[:pallet_finished_product])

    respond_to do |format|
      if @pallet_finished_product.save
        format.html { redirect_to @pallet_finished_product, notice: 'Pallet finished product was successfully created.' }
        format.json { render json: @pallet_finished_product, status: :created, location: @pallet_finished_product }
      else
        format.html { render action: "new" }
        format.json { render json: @pallet_finished_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pallet_finished_products/1
  # PUT /pallet_finished_products/1.json
  def update
    @pallet_finished_product = PalletFinishedProduct.find(params[:id])

    respond_to do |format|
      if @pallet_finished_product.update_attributes(params[:pallet_finished_product])
        format.html { redirect_to @pallet_finished_product, notice: 'Pallet finished product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pallet_finished_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pallet_finished_products/1
  # DELETE /pallet_finished_products/1.json
  def destroy
    @pallet_finished_product = PalletFinishedProduct.find(params[:id])
    @pallet_finished_product.destroy

    respond_to do |format|
      format.html { redirect_to pallet_finished_products_url }
      format.json { head :no_content }
    end
  end
end
