class StoreFinishProductsController < ApplicationController
  # GET /store_finish_products
  # GET /store_finish_products.json
  def index
    @store_finish_products = StoreFinishProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @store_finish_products }
    end
  end

  # GET /store_finish_products/1
  # GET /store_finish_products/1.json
  def show
    @store_finish_product = StoreFinishProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store_finish_product }
    end
  end

  # GET /store_finish_products/new
  # GET /store_finish_products/new.json
  def new
    @store_finish_product = StoreFinishProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @store_finish_product }
    end
  end

  # GET /store_finish_products/1/edit
  def edit
    @store_finish_product = StoreFinishProduct.find(params[:id])
  end

  # POST /store_finish_products
  # POST /store_finish_products.json
  def create
    @store_finish_product = StoreFinishProduct.new(params[:store_finish_product])

    respond_to do |format|
      if @store_finish_product.save
        format.html { redirect_to @store_finish_product, notice: 'Store finish product was successfully created.' }
        format.json { render json: @store_finish_product, status: :created, location: @store_finish_product }
      else
        format.html { render action: "new" }
        format.json { render json: @store_finish_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /store_finish_products/1
  # PUT /store_finish_products/1.json
  def update
    @store_finish_product = StoreFinishProduct.find(params[:id])

    respond_to do |format|
      if @store_finish_product.update_attributes(params[:store_finish_product])
        format.html { redirect_to @store_finish_product, notice: 'Store finish product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @store_finish_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_finish_products/1
  # DELETE /store_finish_products/1.json
  def destroy
    @store_finish_product = StoreFinishProduct.find(params[:id])
    @store_finish_product.destroy

    respond_to do |format|
      format.html { redirect_to store_finish_products_url }
      format.json { head :no_content }
    end
  end
end
