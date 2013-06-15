class FormatsController < ApplicationController
  # GET /formats
  # GET /formats.json
  def index
    @formats = Format.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @formats }
    end
  end

  # GET /formats/1
  # GET /formats/1.json
  def show
    @format = Format.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @format }
    end
  end

  # GET /formats/new
  # GET /formats/new.json
  def new
    @format = Format.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @format }
    end
  end

  # GET /formats/1/edit
  def edit
    @format = Format.find(params[:id])
  end

  # POST /formats
  # POST /formats.json
  def create
    @format = Format.new(params[:format])

    respond_to do |format|
      if @format.save
        format.html { redirect_to @format, notice: 'Format was successfully created.' }
        format.json { render json: @format, status: :created, location: @format }
      else
        format.html { render action: "new" }
        format.json { render json: @format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /formats/1
  # PUT /formats/1.json
  def update
    @format = Format.find(params[:id])

    respond_to do |format|
      if @format.update_attributes(params[:format])
        format.html { redirect_to @format, notice: 'Format was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formats/1
  # DELETE /formats/1.json
  def destroy
    @format = Format.find(params[:id])
    @format.destroy

    respond_to do |format|
      format.html { redirect_to formats_url }
      format.json { head :no_content }
    end
  end
end
