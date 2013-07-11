#encoding: utf-8
class VarietiesController < ApplicationController
  load_and_authorize_resource

  # GET /varieties
  # GET /varieties.json
  def index
    @varieties = Variety.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @varieties }
    end
  end

  # GET /varieties/1
  # GET /varieties/1.json
  def show
    @variety = Variety.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @variety }
    end
  end

  # GET /varieties/new
  # GET /varieties/new.json
  def new
    @variety = Variety.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @variety }
    end
  end

  # GET /varieties/1/edit
  def edit
    @variety = Variety.find(params[:id])
  end

  # POST /varieties
  # POST /varieties.json
  def create
    @variety = Variety.new(params[:variety])
    @variety.company_id = current_user.company_id

    respond_to do |format|
      if @variety.save
        format.html { redirect_to varieties_path, notice: "#{@variety.name} fue creada exitosamente." }
        format.json { render json: @variety, status: :created, location: @variety }
      else
        format.html { render action: "new" }
        format.json { render json: @variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /varieties/1
  # PUT /varieties/1.json
  def update
    @variety = Variety.find(params[:id])

    respond_to do |format|
      if @variety.update_attributes(params[:variety])
        format.html { redirect_to varieties_path, notice: "#{@variety.name} fue editada exitosamente." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /varieties/1
  # DELETE /varieties/1.json
  def destroy
    @variety = Variety.find(params[:id])
    @variety.destroy

    respond_to do |format|
      format.html { redirect_to varieties_url }
      format.json { head :no_content }
    end
  end
end
