#encoding: utf-8
class CustomsController < ApplicationController
  load_and_authorize_resource
  # GET /customs
  # GET /customs.json
  def index
    @customs = Custom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customs }
    end
  end

  # GET /customs/1
  # GET /customs/1.json
  def show
    @custom = Custom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @custom }
    end
  end

  # GET /customs/new
  # GET /customs/new.json
  def new
    @custom = Custom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @custom }
    end
  end

  # GET /customs/1/edit
  def edit
    @custom = Custom.find(params[:id])
  end

  # POST /customs
  # POST /customs.json
  def create
    @custom = Custom.new(params[:custom])
    @custom.company_id = current_user.company_id
    respond_to do |format|
      if @custom.save
        format.html { redirect_to "/customs", notice: "La agencia de aduana #{@custom.line_of_business} fue creado exitosamente." }
        format.json { render json: @custom, status: :created, location: @custom }
      else
        format.html { render action: "new" }
        format.json { render json: @custom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customs/1
  # PUT /customs/1.json
  def update
    @custom = Custom.find(params[:id])

    respond_to do |format|
      if @custom.update_attributes(params[:custom])
        format.html { redirect_to "/customs", notice: "La agencia de aduana #{@custom.line_of_business} fue editada exitosamente." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @custom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customs/1
  # DELETE /customs/1.json
  def destroy
    @custom = Custom.find(params[:id])
    @custom.destroy

    respond_to do |format|
      format.html { redirect_to customs_url }
      format.json { head :no_content }
    end
  end
end
