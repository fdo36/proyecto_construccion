# POST /subprocess_ios
# POST /subprocess_ios.json
class SubprocessIosController < ApplicationController
  # GET /subprocess_ios
  # GET /subprocess_ios.json
  def index
    @subprocess_ios = SubprocessIo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subprocess_ios }
    end
  end

  # GET /subprocess_ios/1
  # GET /subprocess_ios/1.json
  def show
    @subprocess_io = SubprocessIo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subprocess_io }
    end
  end

  # GET /subprocess_ios/new
  # GET /subprocess_ios/new.json
  def new
    @subprocess_io = SubprocessIo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subprocess_io }
    end
  end

  # GET /subprocess_ios/1/edit
  def edit
    @subprocess_io = SubprocessIo.find(params[:id])
  end

  # POST /subprocess_ios
  # POST /subprocess_ios.json
  def create
    @subprocess_io = SubprocessIo.new(params[:subprocess_io])
    @subprocess_io.company_id = current_user.company_id
    respond_to do |format|
      if @subprocess_io.save
        format.html { redirect_to @subprocess_io, notice: 'Subprocess io was successfully created.' }
        format.json { render json: @subprocess_io, status: :created, location: @subprocess_io }
      else
        format.html { render action: "new" }
        format.json { render json: @subprocess_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subprocess_ios/1
  # PUT /subprocess_ios/1.json
  def update
    @subprocess_io = SubprocessIo.find(params[:id])

    respond_to do |format|
      if @subprocess_io.update_attributes(params[:subprocess_io])
        format.html { redirect_to @subprocess_io, notice: 'Subprocess io was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subprocess_io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subprocess_ios/1
  # DELETE /subprocess_ios/1.json
  def destroy
    @subprocess_io = SubprocessIo.find(params[:id])
    @subprocess_io.destroy

    respond_to do |format|
      format.html { redirect_to subprocess_ios_url }
      format.json { head :no_content }
    end
  end
end
