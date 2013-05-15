class RightAccessesController < ApplicationController
  # GET /right_accesses
  # GET /right_accesses.json
  def index
    @right_accesses = RightAccess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @right_accesses }
    end
  end

  # GET /right_accesses/1
  # GET /right_accesses/1.json
  def show
    @right_access = RightAccess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @right_access }
    end
  end

  # GET /right_accesses/new
  # GET /right_accesses/new.json
  def new
    @right_access = RightAccess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @right_access }
    end
  end

  # GET /right_accesses/1/edit
  def edit
    @right_access = RightAccess.find(params[:id])
  end

  # POST /right_accesses
  # POST /right_accesses.json
  def create
    @right_access = RightAccess.new(params[:right_access])

    respond_to do |format|
      if @right_access.save
        format.html { redirect_to @right_access, notice: 'El permiso fue creado correctamente.' }
        format.json { render json: @right_access, status: :created, location: @right_access }
      else
        format.html { render action: "new" }
        format.json { render json: @right_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /right_accesses/1
  # PUT /right_accesses/1.json
  def update
    @right_access = RightAccess.find(params[:id])

    respond_to do |format|
      if @right_access.update_attributes(params[:right_access])
        format.html { redirect_to @right_access, notice: 'El permiso fue modificado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @right_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /right_accesses/1
  # DELETE /right_accesses/1.json
  def destroy
    @right_access = RightAccess.find(params[:id])
    @right_access.destroy

    respond_to do |format|
      format.html { redirect_to right_accesses_url }
      format.json { head :no_content }
    end
  end
end
