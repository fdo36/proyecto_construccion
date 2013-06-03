#encoding: utf-8
class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @kinds = Kind.all
    @varities = Variety.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kinds }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @kind = Kind.find(params[:id])
    @variety = Variety.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kind }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @kind = Kind.new
    @variety = Variety.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kind }
    end
  end

  # GET /products/1/edit
  def edit
    @kind = Kind.find(params[:id])
    @variety = Variety.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @kind = Kind.new(params[:kind])
    @variety = Variety.find(params[:id])

    @kind.company_id = current_user.company_id
    @variety.company_id = current_user.company_id

    respond_to do |format|
      if @kind.save
        format.html { redirect_to '/kinds', notice: "#{@kind.name} fue creada exitosamente." }
        format.json { render json: @kind, status: :created, location: @kind }  
      elsif @variety.save
        format.html { redirect_to '/varities', notice: "#{@variety.name} fue creada exitosamente." }
        format.json { render json: @variety, status: :created, location: @variety }    
      else
        format.html { render action: "new" }
        format.json { render json: @kind.errors, status: :unprocessable_entity }

      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @kind = Kind.find(params[:id])
    @variety = Variety.find(params[:id])

    respond_to do |format|
      if @kind.update_attributes(params[:kind])
        format.html { redirect_to '/kinds', notice: "La especie #{@kind.name} fue editada exitosamente." }
        format.json { head :no_content }
      elsif @variety.update_attributes(params(:variety))
        format.html { redirect_to '/varities', notice: "La especie #{@variety.name} fue editada exitosamente." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @kind = Kind.find(params[:id])
    @kind.destroy

    @variety = Variety.find(params[:id])
    @variety.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

end