class SubprocessesController < ApplicationController
  # GET /subprocesses
  # GET /subprocesses.json
  def index
    @subprocesses = Subprocess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subprocesses }
    end
  end

  # GET /subprocesses/1
  # GET /subprocesses/1.json
  def show
    @subprocess = Subprocess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subprocess }
    end
  end

  # GET /subprocesses/new
  # GET /subprocesses/new.json
  def new
    @subprocess = Subprocess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subprocess }
    end
  end

  # GET /subprocesses/1/edit
  def edit
    @subprocess = Subprocess.find(params[:id])
  end

  # POST /subprocesses
  # POST /subprocesses.json
  def create
    @subprocess = Subprocess.new(params[:subprocess])
    @subprocess.company_id = current_user.company_id
    respond_to do |format|
      if @subprocess.save
        format.html { redirect_to @subprocess, notice: 'Subprocess was successfully created.' }
        format.json { render json: @subprocess, status: :created, location: @subprocess }
      else
        format.html { render action: "new" }
        format.json { render json: @subprocess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subprocesses/1
  # PUT /subprocesses/1.json
  def update
    @subprocess = Subprocess.find(params[:id])

    respond_to do |format|
      if @subprocess.update_attributes(params[:subprocess])
        format.html { redirect_to @subprocess, notice: 'Subprocess was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subprocess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subprocesses/1
  # DELETE /subprocesses/1.json
  def destroy
    @subprocess = Subprocess.find(params[:id])
    @subprocess.destroy

    respond_to do |format|
      format.html { redirect_to subprocesses_url }
      format.json { head :no_content }
    end
  end
end
